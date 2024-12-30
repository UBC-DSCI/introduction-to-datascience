// dynamically load jQuery if not already present on the website
if (typeof jQuery == 'undefined') {
  document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>');
}

var diffidx = 0;

window.addEventListener('load', () => {
  scrollToFirstDiff(diffidx);
  scrollToNextDiff(diffidx);
});

// Borrowed from https://stackoverflow.com/a/15203639
function isElementVisible(el) {
  var rect     = el.getBoundingClientRect(),
      vWidth   = window.innerWidth || document.documentElement.clientWidth,
      vHeight  = window.innerHeight || document.documentElement.clientHeight,
      efp      = function (x, y) { return document.elementFromPoint(x, y) };     

  // Return false if it's not in the viewport
  if (rect.right < 0 || rect.bottom < 0 
          || rect.left > vWidth || rect.top > vHeight)
      return false;

  // Return true if any of its four corners are visible
  return (
        el.contains(efp(rect.left,  rect.top))
    ||  el.contains(efp(rect.right, rect.top))
    ||  el.contains(efp(rect.right, rect.bottom))
    ||  el.contains(efp(rect.left,  rect.bottom))
  );
}

// Scroll to the center of first diff element on page
function scrollToFirstDiff(diffidx) {
  var cur;
  cur = $(".diff:visible").eq(diffidx)
  if (typeof cur[0] != "undefined") {
    cur.addClass("diff-selected");
    $(cur)[0].scrollIntoView({ behavior: "smooth", block: "center", inline: "nearest"});
  }
}

// Scroll to the next diff element on pressing n, previous on pressing Shift + n
function scrollToNextDiff(diffidx) {
  $(document).on("keypress", function(e) {
    var cur;	
    var next;
    cur = $(".diff:visible").eq(diffidx)
    if (typeof cur[0] == "undefined") {
      return;
    }
    cur.removeClass("diff-selected");
    if (e.which == 110){
     
     var diffidx_tmp = diffidx + 1;
     if (diffidx_tmp > $(".diff:visible").length-1){
       diffidx_tmp = $(".diff:visible").length-1;
     }
     var cur_tmp = $(".diff:visible").eq(diffidx_tmp);
 
     while (isElementVisible(cur_tmp[0])) {
       diffidx_tmp += 1;
       if (diffidx_tmp > $(".diff:visible").length-1){
           diffidx_tmp = $(".diff:visible").length-1;
           break
       }
       cur_tmp = $(".diff:visible").eq(diffidx_tmp)
     }
     cur = cur_tmp
     diffidx = diffidx_tmp
    } 
    if (e.which == 78) {
      
      var diffidx_tmp = diffidx - 1;
      if (diffidx_tmp < 0){
       diffidx_tmp = 0;
      }
      var cur_tmp = $(".diff:visible").eq(diffidx_tmp);
 
      while (isElementVisible(cur_tmp[0])) {
       diffidx_tmp -= 1;
       if (diffidx_tmp < 0){
         diffidx_tmp = 0;
         break
       }
       cur_tmp = $(".diff:visible").eq(diffidx_tmp)
      }
      cur = cur_tmp
      diffidx = diffidx_tmp
    }
    next = $(".diff:visible").eq(diffidx)
    next.addClass("diff-selected")
    $(next)[0].scrollIntoView({ behavior: "smooth", block: "center", inline: "nearest"});
 });
}