package auv.casestudy.dsms;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.eclipse.epsilon.common.dt.util.LogUtil;
import org.eclipse.epsilon.common.parse.problem.ParseProblem;
import org.eclipse.epsilon.common.util.StringProperties;
import org.eclipse.epsilon.emc.emf.EmfModel;
import org.eclipse.epsilon.emf.dt.EmfRegistryManager;
import org.eclipse.epsilon.eol.EolModule;
import org.eclipse.epsilon.eol.exceptions.models.EolModelLoadingException;
import org.eclipse.epsilon.eol.models.IModel;
import org.eclipse.epsilon.eol.models.IRelativePathResolver;

import auv.casestudy.driver.AbstractExecutor;

public class DynamicSMS {

	protected EolModule eolModule;
	protected String safety_case_location;
	protected String models_location;
	protected Object result;

	public static void main(String[] args) {
		DynamicSMS dsms = new DynamicSMS("model/auv.assurancecase", "model/");
		try {
			dsms.refresh();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public DynamicSMS(String safety_case_location, String models_location) {
		this.safety_case_location = safety_case_location;
		this.models_location = models_location;
		registerMetamodels();
		eolModule = new EolModule();
	}

	public void refresh() throws Exception {
		String query = "Artifact.all();";
		eolModule.parse(query);
		if (eolModule.getParseProblems().size() > 0) {
			System.err.println("Parse errors occured...");
			for (ParseProblem problem : eolModule.getParseProblems()) {
				System.err.println(problem.toString());
			}
			return;
		}

		eolModule.getContext().getModelRepository().addModel(getModel());
		result = eolModule.execute();
		System.out.println(result);
	}

	public IModel getModel() throws Exception {
		return createEmfModelByURI("M", safety_case_location, "http://org.eclipse.acme/1.0/gsn", true, false);

	}

	public static EmfModel createEmfModelByURI(String name, String model, String metamodel, boolean readOnLoad,
			boolean storeOnDisposal) throws EolModelLoadingException, URISyntaxException {
		EmfModel emfModel = new EmfModel();
		StringProperties properties = new StringProperties();
		properties.put(EmfModel.PROPERTY_NAME, name);
		properties.put(EmfModel.PROPERTY_METAMODEL_URI, metamodel);
		properties.put(EmfModel.PROPERTY_MODEL_URI, getFileURI(model).toString());
		properties.put(EmfModel.PROPERTY_READONLOAD, readOnLoad + "");
		properties.put(EmfModel.PROPERTY_STOREONDISPOSAL, storeOnDisposal + "");
		emfModel.load(properties, (IRelativePathResolver) null);
		return emfModel;
	}
	
	public static URI getFileURI(String fileName) throws URISyntaxException {

		URL binUrl = AbstractExecutor.class.getResource(fileName);
		URI uri = null;
		if (binUrl == null) {
			binUrl = DynamicSMS.class.getProtectionDomain().getCodeSource().getLocation();

			uri = new URI(binUrl.toString().replaceAll("/bin", "") + fileName);
		} else {
			URI binUri = binUrl.toURI();
			if (binUri.toString().indexOf("bin") > -1) {
				uri = new URI(binUri.toString().replaceAll("bin", "src"));
			} else {
				uri = binUri;
			}
		}
		return uri;
	}
	
	private boolean registerMetamodels() {
		URL binUrl = DynamicSMS.class.getProtectionDomain().getCodeSource().getLocation();
		URI uri = null;
		try {
			uri = new URI(binUrl.toString().replaceAll("/bin", "") + models_location);
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		File f = new File(uri);

		for(File file: f.listFiles()) {
			String filename = f.getParentFile().getName() + "/" + f.getName() + "/" + file.getName();
			try {
				EmfRegistryManager.getInstance().addMetamodel(filename);
				LogUtil.logInfo(filename + " registered successfully");
			}
			catch (Exception ex) {
				LogUtil.log(filename + " could not be registered", ex);
				return false;
			}
		}
		return true;
	}
}
