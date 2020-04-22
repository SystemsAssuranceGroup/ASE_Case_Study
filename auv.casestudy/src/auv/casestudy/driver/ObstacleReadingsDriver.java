package auv.casestudy.driver;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.epsilon.eol.EolModule;
import org.eclipse.epsilon.eol.IEolModule;
import org.eclipse.epsilon.eol.models.IModel;

public class ObstacleReadingsDriver extends AbstractExecutor {

	protected ArrayList<String> readings = new ArrayList<>();
	
	public ObstacleReadingsDriver(String... reading) {
		if (reading.length == 6) {
			for(String s: reading) {
				readings.add(s);
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
		models.add(createEmfModel("M", "model/obstacle_reading.auv_data", "model/auv_data.ecore", false, true));
		return models;
	}
	
	@Override
	public String getQuery() throws Exception {
		if (readings.size() == 0) {
			throw new Exception("Invalid readings");
		}
		else {
			String query = "var reading = new ObstacleReading;\r\n" + 
					"reading.ns_rel_dist = "+ readings.get(0) +";\r\n" + 
					"reading.ew_rel_dist = "+ readings.get(1) +";\r\n" +
					"reading.obs_depth = "+ readings.get(2) +";\r\n" +
					"reading.obs_ns_vel = "+ readings.get(3) +";\r\n" +
					"reading.obs_ew_vel = "+ readings.get(4) +";\r\n" +
					"reading.obs_roc = "+ readings.get(5) +";";
			return query;
		}
	}
	
	public static void main(String[] args) {
		//valid range {-50.0, 50.0}, {-50.0, 50.0},{-10.0..0.0}, {-5.0..5.0}, {-5.0..5.0} and {-5.0..5.0}
		ObstacleReadingsDriver driver = new ObstacleReadingsDriver("-5.0", "-5.0", "-5.0", "3.0", "2.0", "2.0");
		try {
			driver.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
