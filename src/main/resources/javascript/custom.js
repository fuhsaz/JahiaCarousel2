$(document).ready(function(){
  console.log("ready");
  $('.carouselMain').each(function(){
    var thisID = $(this).attr('id');
    console.log("thisID", thisID);
    var settings = {autoPlay:2000};
  	var items;
    
    /* Number of items at max display size */
    searchString = getSS(thisID, 'Items');
    /*console.log("searchString", searchString);*/
    var itemsInput = $(searchString).text();
    /*console.log("itemsInput", itemsInput);*/
    if (!itemsInput.localeCompare('none')==0) {
    	items = parseInt(itemsInput);
       	settings.items = items;
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