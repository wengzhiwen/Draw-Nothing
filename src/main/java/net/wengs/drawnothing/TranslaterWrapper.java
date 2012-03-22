package net.wengs.drawnothing;

/**
 * @author Sutra Zhou
 */
public class TranslaterWrapper implements Translater {

	private CETTranslater cetTranslater;

	private SdcvTranslater sdcvTranslater;

	/**
	 *
	 */
	public TranslaterWrapper() {
		cetTranslater = new CETTranslater();
		sdcvTranslater = new SdcvTranslater();
	}

	/**
	 * {@inheritDoc}
	 */
	public String translate(String word) {
		String s = cetTranslater.translate(word);
		if (s == null) {
			s = sdcvTranslater.translate(word);
		}
		return s;
	}

}
