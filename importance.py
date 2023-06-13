n_steps = 50
idx = 1


def preds_and_grads(inputs, model, baselines=None, n_steps=50, target=1, numpy=False):
    """
    function to get predictions and gradients of the output wrt features values
    
    Args:
        inputs : Tensor of inputs
        model : pytorch model
        baselines : Tensor or None of baselines 
        n_steps : int number of steps to approximate integrated gradients
        target : int target class
        numpy : bool if true return numpy, else Tensor
    """
    if inputs.dim() == 2:
        inputs = inputs.unsqueeze(0)
    
    if baselines == None:
        baselines = torch.zeros_like(inputs)
    
    # k/m in the formula
    alphas = torch.linspace(0, 1, n_steps).tolist()
    
    # direct path from baseline to input. shape : ([n_steps, n_features], )
    scaled_features = tuple(
            torch.cat(
                [baseline + alpha * (input - baseline) for alpha in alphas], dim=0
            ).requires_grad_()
            for input, baseline in zip(inputs, baselines)
        )
    
    # predictions at every step. shape : [n_steps, 1]
    preds = model(scaled_features[0])[:, target]
    # gradients of predictions wrt input features. shape : [n_steps, n_features]
    grads = grad(outputs=torch.unbind(preds), inputs=scaled_features)
    if numpy:
        return preds.detach().numpy(), grads[0].detach().numpy()
    return preds, grads
    

explainer = shap.GradientExplainer(model, X_train)
gradient_values =explainer.shap_values(X_train)

print(np.asarray(gradient_values).shape)

gradient_2d=np.reshape(gradient_values, (x,y))

rf_resultX = pd.DataFrame(gradient_2d, columns = feature_names)
mean_gradient=rf_resultX.describe().loc[['mean']]
mean_gradient=abs(mean_gradient)
