describe('Pairing unit test', function() {
  it('returns an available pair partner', function () {
    var result = pairMe(2,[2,3],[]);
    expect(result).toEqual([3]);
  });

  it('returns an array of available pair partners', function () {
    var result = pairMe(9,[2,9,22,3,5],[]);
    result = result.sort(function(a, b){return a-b});
    expect(result).toEqual([2,3,5,22]);
  });

  it('returns an array excluding a couple paired today', function () {
    var thisDate = new Date();
    var history = [[1,1,thisDate],[1,5,thisDate]];
    var result = pairMe(2,[1,2,3,5],history);
    result = result.sort(function(a, b){return a-b});
    expect(result).toEqual([3]);
  });


});
