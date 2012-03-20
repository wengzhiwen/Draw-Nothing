package net.wengs.drawnothing;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;

/**
 * @author Sutra Zhou
 */
public class SdcvTranslater implements Translater {

	/**
	 * {@inheritDoc}
	 */
	public String translate(String word) {
		try {
			Process p = Runtime.getRuntime().exec(
					new String[] { "/usr/local/bin/sdcv", "-n", "-u",
							"XDICT英汉辞典", word });
			InputStream input = p.getInputStream();
			return IOUtils.toString(input);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

}
