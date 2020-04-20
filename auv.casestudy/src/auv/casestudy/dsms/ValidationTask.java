package auv.casestudy.dsms;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.epsilon.common.parse.problem.ParseProblem;
import org.eclipse.epsilon.eol.EolModule;
import org.eclipse.epsilon.eol.IEolModule;
import org.eclipse.epsilon.eol.execute.context.Variable;
import org.eclipse.epsilon.eol.models.IModel;

import auv.casestudy.driver.AbstractExecutor;

public class ValidationTask extends AbstractExecutor {

	protected String model_name;
	protected String model_file;
	protected String metamodel_file;
	protected String query;
	
	public ValidationTask(String model_name, String model_file, String metamodel_file, String query) {
		this.model_name = model_name;
		this.model_file = model_file;
		this.metamodel_file = metamodel_file;
		this.query = query;
	}
	
	public synchronized boolean validate() throws Exception {
	    boolean ret = false;
	    module = createModule();
	    module.parse(getQuery());
	    
	    if (module.getParseProblems().size() > 0) {
	      System.err.println("Parse errors occured...");
	      for (ParseProblem problem : module.getParseProblems()) {
	        System.err.println(problem.toString());
	      }
	      return ret;
	    }
	    
	    for (IModel model : getModels()) {
	      module.getContext().getModelRepository().addModel(model);
	    }for (Variable parameter : parameters) {
	      module.getContext().getFrameStack().put(parameter);
	    }
	    
	    preProcess();
	    ret = (boolean) execute(module);
	    postProcess();
	    
	    module.getContext().getModelRepository().dispose();
	    return ret;
	  }
	
	@Override
	public IEolModule createModule() {
		return new EolModule();
	}

	@Override
	public String getQuery() throws Exception {
		return query;
	}

	@Override
	public List<IModel> getModels() throws Exception {
		List<IModel> models = new ArrayList<>();
		models.add(createEmfModel(model_name, model_file, metamodel_file, true, false));
		return models;
	}

}
