var lunr_index = lunr(function () {
    this.field('title', {boost: 10});
    this.field('body');
    this.ref('url');
 });
 
