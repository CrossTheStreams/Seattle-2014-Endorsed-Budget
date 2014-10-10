// Take in text, and justify to a field of the specified width with spaces
function justify(text, width) {
    
  var words = text.split(" "),
      lines = [],
      lineLength = 0,
      lineIdx = 0;
  
  for (var i = 0; i < words.length; i ++) {
    var word = words[i]
      
    if (lineLength + (word.length) > width) {
      lineIdx += 1;
      lineLength = 0; 
    }
    
    var wordToAdd = (lineLength + word.length >= (width-1)) ? word : word + " ";
      
    if (lines[lineIdx]) {
      lines[lineIdx].push(wordToAdd)
    } else {
      lines[lineIdx] = [wordToAdd]
    }

    lineLength = lines[lineIdx].join("").length;
  }

  var justifiedLines = [];
  for (var i = 0; i < lines.length; i ++) {
    var line = lines[i],
        n = 0;
    while (line.join("").length < width) {
      n += 1;
      var spaceIdx = Math.round(((line.length/2) + (n)) % line.length);
      console.log(spaceIdx);
      if (spaceIdx >= (line.length - 1)) {
        continue;
      }
      line[spaceIdx] = line[spaceIdx] + " ";
    }
    justifiedLines[i] = line.join("");
  }

  var justified = justifiedLines.join("");
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
  it("doesn't change text that fits the width", function() {
    expect(justify(doesntChange, width)).toMatch(doesntChange);
  });
  it("doesn't change text that fits the width", function() {
    expect(justify(doesntChange, width).length).toEqual(50);
  });
  it("fits text shorter than the width", function() {
    var justifiedShortTweet = "Um,      ice      bars      are      the      jam.";
    expect(justify(shortTweet, width)).toMatch(justifiedShortTweet);
  });
  it("adds a single space to fit the width", function() {
    var justifiedNeedsSingleSpace = "Lorem ipsum dolor  et consectetuer adipiscing eli."
    expect(justify(needsSingleSpace, width)).toEqual(justifiedNeedsSingleSpace);
  });

  it("adds a single space to fit the width", function() {
    var justifiedNeedsSingleSpace = "Lorem ipsum dolor  et consectetuer adipiscing eli."
    expect(justify(needsSingleSpace, width)).toEqual(justifiedNeedsSingleSpace);
  });
  //it("fits text longer than the width, with new lines", function() {
    //var justifiedLongerTweet = 
    //expect(justify(shortTweet, width)).toEqual();
  //});
});

