$(document).ready(function(){
  console.log("ready");
  $('.carouselMain').each(function(){
    var thisID = $(this).attr('id');
    console.log("thisID", thisID);
    var settings = {autoPlay:2000};
  	var items;
    var singleItem;
    
    /* ===========   Number of items onscreen   ================= */
    /* Number of items at max display size */
    searchString = getSS(thisID, 'Items');
    var itemsInput = $(searchString).text();
    if (!itemsInput.localeCompare('none')==0) {
    	items = parseInt(itemsInput);
       	settings.items = items;
    }
    /* Option to display only a single item */
    var tempSingle = $(getSS(thisID, 'SingleItem')).text();
    if (!tempSingle.localeCompare('none')==0) {
    	if (tempSingle.localeCompare('true') == 0) {
     		singleItem = true;
    	} else {
     		singleItem = false;
    	}
      	settings.singleItem = singleItem;
    }
    
    
    /* Call the owlCarousel() method with the constructed settings object */
    $(this).owlCarousel(settings);
    
  });
    
  /* To generate the '.carouselID .carouselDesiredVariable' selector for jquery */
  function getSS(id, varName){
    var ss = ".";
    ss += id;
    ss += " .carousel";
    ss += varName;
    return ss;
  };
  
  /*
  $('carousel1').owlCarousel({
    autoPlay: 3000,
    singleItem: true
  });
  */
  
  
  
});