describe('Pairing unit test', function() {
  it('returns an available pair partner', function (){
    var result = pairMe(2,[2,3],[]);
    expect(result).toEqual([3]);
  });
});
