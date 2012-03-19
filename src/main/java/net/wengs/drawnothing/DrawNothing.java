package net.wengs.drawnothing;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * @author Sutra Zhou
 */
public class DrawNothing {

	private int answerMinLength = 3;
	private int answerMaxLength = 8;

	private List<String>[] dicts;

	public DrawNothing() throws IOException {
		initDicts();
	}

	public Collection<String> riddle(String givenLetters, int answerWordLength) {
		List<String> dict = dicts[answerWordLength - answerMinLength];
		Collection<String> answers = new ArrayList<String>();

		Collection<Character> candidates = toCollection(givenLetters.toLowerCase());
		for (String word : dict) {
			boolean sub = CollectionUtils.isSubCollection(toCollection(word),
					candidates);
			if (sub) {
				answers.add(word);
			}
		}

		return answers;
	}

	@SuppressWarnings("unchecked")
	private void initDicts() throws IOException {
		List<String> words = IOUtils.readLines(DrawNothing.class
				.getResourceAsStream("words.txt"));

		dicts = new ArrayList[answerMaxLength - answerMinLength + 1];
		for (int i = answerMinLength; i <= answerMaxLength; i++) {
			dicts[i - answerMinLength] = new ArrayList<String>();
		}

		for (String word : words) {
			dicts[word.length() - answerMinLength].add(word.toLowerCase());
		}
	}

	private Collection<Character> toCollection(String str) {
		char[] chars = str.toCharArray();
		Collection<Character> candidates = new ArrayList<Character>(
				chars.length);
		for (char c : chars) {
			candidates.add(c);
		}
		return candidates;
	}

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		DrawNothing dn = new DrawNothing();

		long start = System.currentTimeMillis();

		Collection<String> answers = dn.riddle(args[0],
				Integer.parseInt(args[1]));

		long end = System.currentTimeMillis();

		System.out.println(end - start);
		System.out.println(StringUtils.join(answers, "\n"));
	}

}
