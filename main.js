function groupAnagrams(words) {
  const anagramMap = new Map();

  for (const word of words) {
    const sortedWord = word.split("").sort().join("");

    if (anagramMap.has(sortedWord)) {
      anagramMap.get(sortedWord).push(word);
    } else {
      anagramMap.set(sortedWord, [word]);
    }
  }

  const result = Array.from(anagramMap.values())
    .map((group) => group.sort())
    .sort((a, b) => b.length - a.length || a[0].localeCompare(b[0]));

  return result;
}

const words = [
  "kita",
  "atik",
  "tika",
  "suka",
  "aku",
  "kia",
  "kaus",
  "makan",
  "kua",
];
console.log("Hasil : ");
console.log(groupAnagrams(words));
