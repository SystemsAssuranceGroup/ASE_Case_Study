package auv.casestudy.driver;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.epsilon.eol.EolModule;
import org.eclipse.epsilon.eol.IEolModule;
import org.eclipse.epsilon.eol.models.IModel;

public class InputDriver extends AbstractExecutor{

	protected ArrayList<String> params = new ArrayList<>();
	public InputDriver(String... param) {
		if (param.length == 4) {
			for(String s: param) {
				params.add(s);
			}
		}
	}
	
	@Override
	public IEolModule createModule() {
		return new EolModule();
	}

	@Override
	public List<IModel> getModels() throws Exception {
		List<IModel> models = new ArrayList<>();
		models.add(createEmfModel("M", "model/input.auv_data", "model/auv_data.ecore", false, true));
		return models;
	}
	
	@Override
	public String getQuery() throws Exception {
		if (params.size() == 0) {
			throw new Exception("Invalid parameters");
		}
		else {
			String query = "var param = new InputParameter;\r\n" + 
					"param.depth = "+ params.get(0) +";\r\n" + 
					"param.ns_vel = "+ params.get(1) +";\r\n" + 
					"param.ew_vel = "+ params.get(2) +";\r\n" + 
					"param.rate_of_climb = "+ params.get(3) +";";
			return query;
		}
	}
	
	public static void main(String[] args) {
		InputDriver driver = new InputDriver("-5.0", "3.0", "2.0", "2.0");
		try {
			driver.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
