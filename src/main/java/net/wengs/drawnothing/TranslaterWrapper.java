package net.wengs.drawnothing;

/**
 * @author Sutra Zhou
 */
public class TranslaterWrapper implements Translater {

	private CET4Translater cet4Translater;

	private SdcvTranslater sdcvTranslater;

	/**
	 *
	 */
	public TranslaterWrapper() {
		cet4Translater = new CET4Translater();
		sdcvTranslater = new SdcvTranslater();
	}

	/**
	 * {@inheritDoc}
	 */
	public String translate(String word) {
		String s = cet4Translater.translate(word);
		if (s == null) {
			s = sdcvTranslater.translate(word);
		}
		return s;
	}

}
