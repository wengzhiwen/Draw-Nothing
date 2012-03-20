package net.wengs.drawnothing;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.SystemUtils;

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
			List<String> lines = IOUtils.readLines(input);
			StringBuilder sb = new StringBuilder();
			for (int i = 1, l = lines.size(); i < l; i++) {
				String line = lines.get(i);
				if (!line.startsWith("-->")) {
					sb.append(line).append(SystemUtils.LINE_SEPARATOR);
				}
			}
			return sb.toString();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

}
