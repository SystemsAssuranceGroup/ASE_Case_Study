package auv.casestudy.dsms;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.eclipse.epsilon.common.util.StringProperties;
import org.eclipse.epsilon.emc.emf.EmfModel;
import org.eclipse.epsilon.eol.exceptions.models.EolModelLoadingException;
import org.eclipse.epsilon.eol.models.IRelativePathResolver;

import auv.casestudy.driver.AbstractExecutor;

public class DSMSUtil {

	public static EmfModel createEmfModel(String name, String model, String metamodel, boolean readOnLoad,
			boolean storeOnDisposal) throws EolModelLoadingException, URISyntaxException {
		EmfModel emfModel = new EmfModel();
		StringProperties properties = new StringProperties();
		properties.put(EmfModel.PROPERTY_NAME, name);
		properties.put(EmfModel.PROPERTY_FILE_BASED_METAMODEL_URI, getFileURI(metamodel).toString());
		properties.put(EmfModel.PROPERTY_MODEL_URI, getFileURI(model).toString());
		properties.put(EmfModel.PROPERTY_READONLOAD, readOnLoad + "");
		properties.put(EmfModel.PROPERTY_STOREONDISPOSAL, storeOnDisposal + "");
		emfModel.load(properties, (IRelativePathResolver) null);
		return emfModel;
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
			binUrl = AbstractExecutor.class.getProtectionDomain().getCodeSource().getLocation();

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

}
