package net.wengs.drawnothing;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;

/**
 * @author Sutra Zhou
 */
public class CET4Translater implements Translater{

	private Map<String, String> dict;

	public CET4Translater() {
		try {
			initDict();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * {@inheritDoc}
	 */
	public String translate(String word) {
		return dict.get(word);
	}

	/**
	 * Initialize the dictionary.
	 * @throws IOException
	 */
	private void initDict() throws IOException {
		dict = new HashMap<String, String>();

		InputStream input = getClass().getResourceAsStream("cet4.txt");
		try {
			Reader reader = new InputStreamReader(input, "UTF-8");
			LineNumberReader lnr = new LineNumberReader(reader);
			String line;
			int seperatorIndex;
			while ((line = lnr.readLine()) != null) {
				seperatorIndex = line.indexOf(" ");
				dict.put(line.substring(0, seperatorIndex),
						line.substring(seperatorIndex + 1, line.length()));
			}
		} finally {
			IOUtils.closeQuietly(input);
		}
	}

}
