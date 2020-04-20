package auv.casestudy.dsms;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.epsilon.common.parse.problem.ParseProblem;
import org.eclipse.epsilon.common.util.StringProperties;
import org.eclipse.epsilon.emc.emf.EmfModel;
import org.eclipse.epsilon.eol.EolModule;
import org.eclipse.epsilon.eol.exceptions.models.EolModelLoadingException;
import org.eclipse.epsilon.eol.models.IModel;
import org.eclipse.epsilon.eol.models.IRelativePathResolver;
import org.eclipse.epsilon.eol.parse.Eol_EolParserRules.returnStatement_return;

import argumentation.Argumentation_Package;
import artifact.Artifact;
import artifact.Artifact_Package;
import assuranceCase.AssuranceCase_Package;
import auv.casestudy.driver.AbstractExecutor;
import base.Base_Package;
import base.ModelElement;
import gsn.Gsn_Package;
import terminology.Terminology_Package;

public class DynamicSMS {

	protected EolModule eolModule;
	protected String safety_case_location;
	protected String models_location;
	protected Object result;
	private static List<Object> metamodels = new ArrayList<Object>();


	public static void main(String[] args) {
		DynamicSMS dsms = new DynamicSMS("model/auv.assurancecase", "model/");
		try {
			dsms.validate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public DynamicSMS(String safety_case_location, String models_location) {
		this.safety_case_location = safety_case_location;
		this.models_location = models_location;
		init_SACM_metamodels();
		eolModule = new EolModule();
	}
	
	public boolean validate() throws Exception {
		for(ModelElement modelElement : getArtifacts()) {
			Artifact artifact = (Artifact) modelElement;
			String path = artifact.getArtifactProperty().get(0).getDescription().getContent().getValue().get(0).getContent();
			if (path != null) {
				String query = artifact.getImplementationConstraint().get(0).getContent().getValue().get(0).getContent();
				String fileName = getFileName(path);
				String extension = getFileExtensions(fileName);
				System.out.println(fileName);
				System.out.println(getEcoreName(extension));
			}
			
		}
		return true;
	}
	
	public String getFileName(String abs) {
		File f = new File(abs);
		String fragments[] = abs.split("\\\\");
		String filename = fragments[fragments.length-1];
		return filename;
	}
	
	public String getFileExtensions(String file) {
		String fragments[] = file.split("\\.");
		String extension = fragments[1];
		return extension;
	}
	
	public String getEcoreName(String extension) {
		return extension+".ecore";
	}
	

	public List<ModelElement> getArtifacts() throws Exception {
		String query = "var artifacts = Artifact.all(); return artifacts;";
		eolModule.parse(query);
		if (eolModule.getParseProblems().size() > 0) {
			System.err.println("Parse errors occured...");
			for (ParseProblem problem : eolModule.getParseProblems()) {
				System.err.println(problem.toString());
			}
			return null;
		}

		eolModule.getContext().getModelRepository().addModel(getModel());
		result = eolModule.execute();
		if (result instanceof List<?>) {
			@SuppressWarnings("unchecked")
			List<ModelElement> list = (List<ModelElement>) result;
			return list;
		}
		return null;
	}

	public IModel getModel() throws Exception {
		return createEmfModelByURI("M", safety_case_location, "http://org.eclipse.acme/1.0/gsn, "
				+ "http://omg.sacm/2.0/artifact, "
				+ "http://omg.sacm/2.0/argumentation, "
				+ "http://omg.sacm/2.0/base, "
				+ "http://omg.sacm/2.0/assurancecase, "
				+ "http://omg.sacm/2.0/terminology", true, false);

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
	
	private void init_SACM_metamodels() {
		Gsn_Package.eINSTANCE.eClass();
		Argumentation_Package.eINSTANCE.eClass();
		Artifact_Package.eINSTANCE.eClass();
		Terminology_Package.eINSTANCE.eClass();
		AssuranceCase_Package.eINSTANCE.eClass();
		Base_Package.eINSTANCE.eClass();
	}
	

}
