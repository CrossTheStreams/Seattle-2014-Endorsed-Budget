// Take in text, and justify to a field of the specified width with spaces
function justify(text, width) {
  var words = text.split(" "),
      lines = [];
  lineLength = 0;
  lineIdx = 0;

  for (var i = 0; i < words.length; i ++) {
    var word = words[i];
    if (lineLength + (word.length) > width) {
      lines[lineIdx]
      lineIdx += 1;
      lineLength = 0; 
    }

    var wordToAdd = (lineLength + word.length == width) ? word : word + " ";
    lines[lineIdx] = (lines[lineIdx] || "") + wordToAdd;
    lineLength = lines[lineIdx].length;
  }

  function lineLength(lineArr) {
    return lineArr.join("").length; 
  };

  for (var i = 0; i < lines.length; i ++) {
    var line = lines[i];
    while (lineLength(line) < width) {
      var spaceIdx = Math.round(((line.length/2) + (i+1)) % line.length);
      line[spaceIdx] = line[spaceIdx] + " ";
    }
    lines[i] = line;
  }

  var justified = lines.join("");
  return justified;
};

// Exactly 50 characters
var doesntChange = "Lorem ipsum dolor et consectetuer adipiscing elit."
// 25 characters
var shortTweet = "Um, ice bars are the jam."
// Exactly 49 characters
var needsSingleSpace = "Lorem ipsum dolor et consectetuer adipiscing eli."
// 134 characters
var longerTweet = "Scientists in the pacific northwest are warning that marijuana farming is threatening local salmon. And also, anything else delicious."

describe("justify()", function() {
  var width = 50;

  //it("doesn't change text that fits the width", function() {
  //  expect(justify(doesntChange, width)).toEqual(doesntChange);
 // });
  it("fits text shorter than the width", function() {
    var justifiedShortTweet = "Um,      ice      bars      are      the      jam.";
    expect(justify(shortTweet, width)).toEqual(justifiedShortTweet);
  });
  //it("adds a single space to fit the width", function() {
    //var needsSingleSpace = "Lorem ipsum dolor  et consectetuer adipiscing eli."
    //expect(justify(needsSingleSpace, width)).toEqual(justifiedNeedsSingleSpace);
  //});
  //it("fits text longer than the width, with new lines", function() {
    //var justifiedLongerTweet = 
    //expect(justify(shortTweet, width)).toEqual();
  //});
});

