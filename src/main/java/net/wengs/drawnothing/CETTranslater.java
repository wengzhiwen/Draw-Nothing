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
public class CETTranslater implements Translater{

	private Map<String, String> dict;

	public CETTranslater() {
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
		addDict("cet4.txt");
		addDict("cet6.txt");
	}

	private void addDict(String dictName) throws IOException {
		InputStream input = getClass().getResourceAsStream(dictName);
		try {
			Reader reader = new InputStreamReader(input, "UTF-8");
			LineNumberReader lnr = new LineNumberReader(reader);
			String line;
			int seperatorIndex;
			while ((line = lnr.readLine()) != null) {
				seperatorIndex = line.indexOf(" ");
				dict.put(line.substring(0, seperatorIndex),
						line.substring(seperatorIndex + 1, line.length()).trim());
			}
		} finally {
			IOUtils.closeQuietly(input);
		}
	}

}
