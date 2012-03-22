package net.wengs.drawnothing;

/**
 * @author Sutra Zhou
 */
public class TranslaterWrapper implements Translater {

	private CETTranslater cet4Translater;

	private SdcvTranslater sdcvTranslater;

	/**
	 *
	 */
	public TranslaterWrapper() {
		cet4Translater = new CETTranslater();
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
