package auv.casestudy.driver;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.epsilon.common.parse.problem.ParseProblem;
import org.eclipse.epsilon.common.util.StringProperties;
import org.eclipse.epsilon.emc.emf.EmfModel;
import org.eclipse.epsilon.eol.IEolModule;
import org.eclipse.epsilon.eol.exceptions.EolRuntimeException;
import org.eclipse.epsilon.eol.exceptions.models.EolModelLoadingException;
import org.eclipse.epsilon.eol.execute.context.Variable;
import org.eclipse.epsilon.eol.models.IModel;
import org.eclipse.epsilon.eol.models.IRelativePathResolver;
import org.eclipse.epsilon.eol.parse.Eol_EolParserRules.returnStatement_return;

public abstract class AbstractExecutor {
	
	  protected IEolModule module;
	  protected List<Variable> parameters = new ArrayList<Variable>();
	  
	  protected Object result;
	  
	  public abstract IEolModule createModule();
	  
	  public abstract String getQuery() throws Exception;
	  
	  public abstract List<IModel> getModels() throws Exception;
	  
	  public void postProcess() {};
	  
	  public void preProcess() {};
	  
	  public void execute() throws Exception {
	    
	    module = createModule();
	    module.parse(getQuery());
	    
	    if (module.getParseProblems().size() > 0) {
	      System.err.println("Parse errors occured...");
	      for (ParseProblem problem : module.getParseProblems()) {
	        System.err.println(problem.toString());
	      }
	      return;
	    }
	    
	    for (IModel model : getModels()) {
	      module.getContext().getModelRepository().addModel(model);
	    }for (Variable parameter : parameters) {
	      module.getContext().getFrameStack().put(parameter);
	    }
	    
	    preProcess();
	    result = execute(module);
	    postProcess();
	    
	    module.getContext().getModelRepository().dispose();
	  }
	  
	  public List<Variable> getParameters() {
	    return parameters;
	  }
	  
	  protected Object execute(IEolModule module) 
	      throws EolRuntimeException {
	    return module.execute();
	  }
	  
	  protected EmfModel createEmfModel(String name, String model, 
	      String metamodel, boolean readOnLoad, boolean storeOnDisposal) 
	          throws EolModelLoadingException, URISyntaxException {
	    EmfModel emfModel = new EmfModel();
         	    StringProperties properties = new StringProperties();
	    properties.put(EmfModel.PROPERTY_NAME, name);
	    properties.put(EmfModel.PROPERTY_FILE_BASED_METAMODEL_URI,
	        getFileURI(metamodel).toString());
	    properties.put(EmfModel.PROPERTY_MODEL_URI, 
	        getFileURI(model).toString());
	    properties.put(EmfModel.PROPERTY_READONLOAD, readOnLoad + "");
	    properties.put(EmfModel.PROPERTY_STOREONDISPOSAL, 
	        storeOnDisposal + "");
	    emfModel.load(properties, (IRelativePathResolver) null);
	    return emfModel;
	  }

	  protected EmfModel createEmfModelByURI(String name, String model, 
	      String metamodel, boolean readOnLoad, boolean storeOnDisposal) 
	          throws EolModelLoadingException, URISyntaxException {
	    EmfModel emfModel = new EmfModel();
	    StringProperties properties = new StringProperties();
	    properties.put(EmfModel.PROPERTY_NAME, name);
	    properties.put(EmfModel.PROPERTY_METAMODEL_URI, metamodel);
	    properties.put(EmfModel.PROPERTY_MODEL_URI, 
	        getFileURI(model).toString());
	    properties.put(EmfModel.PROPERTY_READONLOAD, readOnLoad + "");
	    properties.put(EmfModel.PROPERTY_STOREONDISPOSAL, 
	        storeOnDisposal + "");
	    emfModel.load(properties, (IRelativePathResolver) null);
	    return emfModel;
	  }

	  protected URI getFileURI(String fileName) throws URISyntaxException {
	    
	    URL binUrl = AbstractExecutor.class.getResource(fileName);
	    URI uri = null;
	    if (binUrl == null) {
	    	binUrl = AbstractExecutor.class.getProtectionDomain().getCodeSource().getLocation();
	    	
	    	uri = new URI(binUrl.toString().replaceAll("/bin", "")+ fileName);
		}
	    else {
	    	URI binUri = binUrl.toURI();
	    	if (binUri.toString().indexOf("bin") > -1) {
	  	      uri = new URI(binUri.toString().replaceAll("bin", "src"));
	  	    }
	  	    else {
	  	      uri = binUri;
	  	    }
		}
	    return uri;
	  }

}
