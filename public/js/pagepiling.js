/* ===========================================================
 * pagepiling.js 0.0.4 (Beta)
 *
 * https://github.com/alvarotrigo/pagePiling.js
 * MIT licensed
 *
 * Copyright (C) 2013 alvarotrigo.com - A project by Alvaro Trigo
 *
 * ========================================================== */

(function ($) {
    $.fn.pagepiling = function (options) {
        var container = $(this);
        var lastScrolledDestiny;
        var lastAnimation = 0;
        var isTouch = (('ontouchstart' in window) || (navigator.msMaxTouchPoints > 0));

        //Defines the delay to take place before being able to scroll to the next section
        //BE CAREFUL! Not recommened to change it under 400 for a good behavior in laptops and
        //Apple devices (laptops, mouses...)
        var scrollDelay = 600;

        // Create some defaults, extending them with any options that were provided
        options = $.extend({
            menu: null,
            verticalCentered: true,
            sectionsColor: [],
            anchors: [],
            scrollingSpeed: 700,
            easing: 'swing',
            loopBottom: false,
            loopTop: false,
            css3: true,
            navigation: {
                'textColor': '#000',
                'bulletsColor': '#000',
                'position': 'right',
                'tooltips': ['section1', 'section2', 'section3', 'section4']
            },
            normalScrollElements: null,
            normalScrollElementTouchThreshold: 5,
            touchSensitivity: 5,
            keyboardScrolling: true,
            sectionSelector: '.section',
            animateAnchor: false,

            //events
            afterLoad: null,
            onLeave: null,
            afterRender: null
        }, options);


        /**
        * Defines the scrolling speed
        */
        $.fn.pagepiling.setScrollingSpeed = function(value){
           options.scrollingSpeed = value;
        };

        /**
        * Adds or remove the possiblity of scrolling through sections by using the mouse wheel or the trackpad.
        */
        $.fn.pagepiling.setMouseWheelScrolling = function (value){
            if(value){
                addMouseWheelHandler();
            }else{
                removeMouseWheelHandler();
            }
        };

        /**
        * Adds or remove the possiblity of scrolling through sections by using the mouse wheel/trackpad or touch gestures.
        */
        $.fn.pagepiling.setAllowScrolling = function (value){
            if(value){
                $.fn.pagepiling.setMouseWheelScrolling(true);
                addTouchHandler();
            }else{
                $.fn.pagepiling.setMouseWheelScrolling(false);
                removeTouchHandler();
            }
        };

        /**
        * Adds or remove the possiblity of scrolling through sections by using the keyboard arrow keys
        */
        $.fn.pagepiling.setKeyboardScrolling = function (value){
            options.keyboardScrolling = value;
        };

        /**
        * Moves sectio up
        */
        $.fn.pagepiling.moveSectionUp = function () {
            var prev = $('.pp-section.active').prev('.pp-section');

            //looping to the bottom if there's no more sections above
            if (!prev.length && options.loopTop) {
                prev = $('.pp-section').last();
            }

            if (prev.length) {
                scrollPage(prev);
            }
        };

        /**
        * Moves sectio down
        */
        $.fn.pagepiling.moveSectionDown = function () {
            var next = $('.pp-section.active').next('.pp-section');

            //looping to the top if there's no more sections below
            if(!next.length && options.loopBottom){
                next = $('.pp-section').first();
            }

            if (next.length) {
                scrollPage(next);
            }
        };

        /**
        * Moves the site to the given anchor or index
        */
        $.fn.pagepiling.moveTo = function (section){
            var destiny = '';

            if(isNaN(section)){
                destiny = $('[data-anchor="'+section+'"]');
            }else{
                destiny = $('.pp-section').eq( (section -1) );
            }


            if(destiny.length > 0){
                scrollPage(destiny);
            }
        };

        //adding internal class names to void problem with common ones
        $(options.sectionSelector).each(function(){
            $(this).addClass('pp-section');
        });

        //if css3 is not supported, it will use jQuery animations
        if(options.css3){
            options.css3 = support3d();
        }

        $(container).css({
            'overflow' : 'hidden',
            '-ms-touch-action': 'none',  /* Touch detection for Windows 8 */
            'touch-action': 'none'       /* IE 11 on Windows Phone 8.1*/
        });

        //init
        $.fn.pagepiling.setAllowScrolling(true);

        //creating the navigation dots
        if (!$.isEmptyObject(options.navigation) ) {
            addVerticalNavigation();
        }

         var zIndex = $('.pp-section').length;

        $('.pp-section').each(function (index) {
            $(this).data('data-index', index);
            $(this).css('z-index', zIndex);

            //if no active section is defined, the 1st one will be the default one
            if (!index && $('.pp-section.active').length === 0) {
                $(this).addClass('active');
            }

            if (typeof options.anchors[index] !== 'undefined') {
                $(this).attr('data-anchor', options.anchors[index]);
            }

            if (typeof options.sectionsColor[index] !== 'undefined') {
                $(this).css('background-color', options.sectionsColor[index]);
            }

            if(options.verticalCentered){
                addTableClass($(this));
            }

            zIndex = zIndex - 1;
        }).promise().done(function(){
            //vertical centered of the navigation + first bullet active
            if(options.navigation){
                $('#pp-nav').css('margin-top', '-' + ($('#pp-nav').height()/2) + 'px');
                $('#pp-nav').find('li').eq($('.pp-section.active').index('.pp-section')).find('a').addClass('active');
            }

            $(window).on('load', function() {
                scrollToAnchor();
            });

            $.isFunction( options.afterRender ) && options.afterRender.call( this);
        });


        /**
        * Enables vertical centering by wrapping the content and the use of table and table-cell
        */
        function addTableClass(element){
            element.addClass('pp-table').wrapInner('<div class="pp-tableCell" style="height:100%" />');
        }

        /**
        * Determines the direction of the movement (up or down)
        */
        function getYmovement(){
             var sectionIndex = destination.index('.pp-section');

             if( $('.pp-section.active').index('.pp-section') < sectionIndex ){
                return 'down';
             }
             return 'up';
        }

        /**
        * Scrolls the page to the given destination
        */
        function scrollPage(destination, animated) {
            var activeSection = $('.pp-section.active');
            var anchorLink  = destination.data('anchor');
            var sectionIndex = destination.index('.pp-section');
            var toMove = destination;
            var yMovement = getYmovement(destination);
            var leavingSection = activeSection.index('.pp-section') + 1;

            if(typeof animated === 'undefined'){
                animated = true;
            }

            if(typeof anchorLink !== 'undefined'){
                setURLHash(anchorLink);
            }

            destination.addClass('active').siblings().removeClass('active');

            //moving sections up making them disappear
            if (activeSection.index('.pp-section') < sectionIndex) {
                var translate3d = 'translate3d(0px, -100%, 0px)';
                var scrolling = '-100%';

                var sectionsToMove = $('.pp-section').map(function(index){
                    if (index < destination.index('.pp-section')){
                        return $(this);
                    }
                });

                if(!options.css3){
                    sectionsToMove.each(function(index){
                        if(index != activeSection.index('.pp-section')){
                            $(this).css({'top': scrolling})
                        }
                    });
                }

                var animateSection = activeSection;
                var readjustSections = function(){};

            }

            //moving section down to the viewport
            else {
                var translate3d = 'translate3d(0px, 0px, 0px)';
                var scrolling = '0';

                var sectionsToMove = $('.pp-section').map(function(index){
                    if (index > destination.index('.pp-section')){
                        return $(this);
                    }
                });

                var animateSection = destination;

                var readjustSections = function(){
                    sectionsToMove.each(function(index){
                        $(this).css({'top': scrolling})
                    });
                };
            }

            var afterSectionLoads = function(){
                //callback (afterLoad) if the site is not just resizing and readjusting the slides
                $.isFunction(options.afterLoad) && options.afterLoad.call(this, anchorLink, (sectionIndex + 1));
            }

            $.isFunction(options.onLeave) && options.onLeave.call(this, leavingSection, (sectionIndex + 1), yMovement);

            if(options.css3){
                transformContainer(animateSection, translate3d, animated);

                sectionsToMove.each(function(){
                    transformContainer($(this), translate3d, animated);
                });

                setTimeout(function () {
                    afterSectionLoads();
                }, options.scrollingSpeed);
            }else{
                if(animated){
                    animateSection.animate({
                        'top': scrolling
                    }, options.scrollingSpeed, options.easing, function () {
                        readjustSections();

                        afterSectionLoads();
                    });
                }else{
                    animateSection.css('top', scrolling);
                    setTimeout(function(){
                        readjustSections();
                        afterSectionLoads();
                    },400);

                }
            }

            activateMenuElement(anchorLink);
            activateNavDots(anchorLink, sectionIndex);
            lastScrolledDestiny = anchorLink;

            var timeNow = new Date().getTime();
            lastAnimation = timeNow;
        }

        /**
        * Scrolls the site without anymations (usually used in the background without the user noticing it)
        */
        function silentScroll(section, top){
            if (options.css3) {
                var translate3d = 'translate3d(0px, ' + top + ', 0px)';
                transformContainer(section, translate3d, false);
            }
            else {
                section.css("top", top);
            }
        }

        /**
        * Sets the URL hash for a section with slides
        */
        function setURLHash(anchorLink){
            if(options.anchors.length){
                location.hash = anchorLink;
            }
        }

        //TO DO
        function scrollToAnchor(){
            //getting the anchor link in the URL and deleting the `#`
            var value =  window.location.hash.replace('#', '');
            var sectionAnchor = value;
            var section = $('.pp-section[data-anchor="'+sectionAnchor+'"]');

            if(section.length > 0){  //if theres any #
                scrollPage(section, options.animateAnchor);
            }
        }

        /**
        * Determines if the transitions between sections still taking place.
        * The variable `scrollDelay` adds a "save zone" for devices such as Apple laptops and Apple magic mouses
        */
        function isMoving(){
            var timeNow = new Date().getTime();
            // Cancel scroll if currently animating or within quiet period
            if (timeNow - lastAnimation < scrollDelay + options.scrollingSpeed) {
                return true;
            }
            return false;
        }

        //detecting any change on the URL to scroll to the given anchor link
        //(a way to detect back history button as we play with the hashes on the URL)
        $(window).on('hashchange', hashChangeHandler);

        /**
        * Actions to do when the hash (#) in the URL changes.
        */
        function hashChangeHandler(){
            var value =  window.location.hash.replace('#', '').split('/');
            var sectionAnchor = value[0];

            if(sectionAnchor.length){
                //when moving to a slide in the first section for the first time (first time to add an anchor to the URL)
                var isFirstMove =  (typeof lastScrolledDestiny === 'undefined');

                /*in order to call scrollpage() only once for each destination at a time
                It is called twice for each scroll otherwise, as in case of using anchorlinks `hashChange`
                event is fired on every scroll too.*/
                if (sectionAnchor && sectionAnchor !== lastScrolledDestiny)  {
                    if(isNaN(sectionAnchor)){
                        var section = $('[data-anchor="'+sectionAnchor+'"]');
                    }else{
                        var section = $('.pp-section').eq( (sectionAnchor -1) );
                    }

                    scrollPage(section);
                }
            }
        }

        /**
        * Cross browser transformations
        */
        function getTransforms(translate3d) {
            return {
                '-webkit-transform': translate3d,
                    '-moz-transform': translate3d,
                    '-ms-transform': translate3d,
                    'transform': translate3d
            };
        }

        /**
         * Adds a css3 transform property to the container class with or without animation depending on the animated param.
         */
        function transformContainer(element, translate3d, animated) {
            element.toggleClass('pp-easing', animated);

            element.css(getTransforms(translate3d));
        }

        /**
         * Sliding with arrow keys, both, vertical and horizontal
         */
        $(document).keydown(function (e) {
            if(options.keyboardScrolling && !isMoving()){
                //Moving the main page with the keyboard arrows if keyboard scrolling is enabled
                switch (e.which) {
                    //up
                    case 38:
                    case 33:
                        $.fn.pagepiling.moveSectionUp();
                        break;

                        //down
                    case 40:
                    case 34:
                        $.fn.pagepiling.moveSectionDown();
                        break;

                        //Home
                    case 36:
                        $.fn.pagepiling.moveTo(1);
                        break;

                        //End
                    case 35:
                        $.fn.pagepiling.moveTo($('.pp-section').length);
                        break;

                        //left
                    case 37:
                        $.fn.pagepiling.moveSlideLeft();
                        break;

                        //right
                    case 39:
                        $.fn.pagepiling.moveSlideRight();
                        break;

                    default:
                        return; // exit this handler for other keys
                }
            }
        });

        if(options.normalScrollElements){
            $(document).on('mouseenter', options.normalScrollElements, function () {
                $.fn.pagepiling.setMouseWheelScrolling(false);
            });

            $(document).on('mouseleave', options.normalScrollElements, function(){
                $.fn.pagepiling.setMouseWheelScrolling(true);
            });
        }

        /**
         * Detecting mousewheel scrolling
         *
         * http://blogs.sitepointstatic.com/examples/tech/mouse-wheel/index.html
         * http://www.sitepoint.com/html5-javascript-mouse-wheel/
         */
        function MouseWheelHandler(e) {
            if(!isMoving()){
                // cross-browser wheel delta
                e = window.event || e;
                var delta = Math.max(-1, Math.min(1,
                        (e.wheelDelta || -e.deltaY || -e.detail)));

                var activeSection = $('.pp-section.active');
                var scrollable = isScrollable(activeSection);

                //scrolling down?
                if (delta < 0) {
                    scrolling('down', scrollable);

                //scrolling up?
                }else {
                    scrolling('up', scrollable);
                }


                return false;
            }
         }

        /**
        * Determines the way of scrolling up or down:
        * by 'automatically' scrolling a section or by using the default and normal scrolling.
        */
        function scrolling(type, scrollable){
            if(type == 'down'){
                var check = 'bottom';
                var scrollSection = $.fn.pagepiling.moveSectionDown;
            }else{
                var check = 'top';
                var scrollSection = $.fn.pagepiling.moveSectionUp;
            }

            if(scrollable.length > 0 ){
                //is the scrollbar at the start/end of the scroll?
                if(isScrolled(check, scrollable)){
                    scrollSection();
                }else{
                    return true;
                }
            }else{
                // moved up/down
                scrollSection();
            }
        }

         /**
        * Determines whether the active section or slide is scrollable through and scrolling bar
        */
        function isScrollable(activeSection){
            scrollable = activeSection.find('.pp-scrollable');

            return scrollable;
        }

       /**
        * Retuns `up` or `down` depending on the scrolling movement to reach its destination
        * from the current section.
        */
        function getYmovement(destiny){
            var fromIndex = $('.pp-section.active').index('.pp-section');
            var toIndex = destiny.index('.pp-section');

            if(fromIndex > toIndex){
                return 'up';
            }
            return 'down';
        }

        /**
        * Removes the auto scrolling action fired by the mouse wheel and tackpad.
        * After this function is called, the mousewheel and trackpad movements won't scroll through sections.
        */
        function removeMouseWheelHandler(){
            if (container.get(0).addEventListener) {
                container.get(0).removeEventListener('mousewheel', MouseWheelHandler, false); //IE9, Chrome, Safari, Oper
                container.get(0).removeEventListener('wheel', MouseWheelHandler, false); //Firefox
            } else {
                container.get(0).detachEvent("onmousewheel", MouseWheelHandler); //IE 6/7/8
            }
        }

        /**
        * Adds the auto scrolling action for the mouse wheel and tackpad.
        * After this function is called, the mousewheel and trackpad movements will scroll through sections
        */
        function addMouseWheelHandler(){
            if (container.get(0).addEventListener) {
                container.get(0).addEventListener("mousewheel", MouseWheelHandler, false); //IE9, Chrome, Safari, Oper
                container.get(0).addEventListener("wheel", MouseWheelHandler, false); //Firefox
            } else {
                container.get(0).attachEvent("onmousewheel", MouseWheelHandler); //IE 6/7/8
            }
        }

        /**
        * Adds the possibility to auto scroll through sections on touch devices.
        */
        function addTouchHandler(){
            if(isTouch){
                //Microsoft pointers
                MSPointer = getMSPointer();

                container.off('touchstart ' +  MSPointer.down).on('touchstart ' + MSPointer.down, touchStartHandler);
                container.off('touchmove ' + MSPointer.move).on('touchmove ' + MSPointer.move, touchMoveHandler);
            }
        }

        /**
        * Removes the auto scrolling for touch devices.
        */
        function removeTouchHandler(){
            if(isTouch){
                //Microsoft pointers
                MSPointer = getMSPointer();

                container.off('touchstart ' + MSPointer.down);
                container.off('touchmove ' + MSPointer.move);
            }
        }

        /*
        * Returns and object with Microsoft pointers (for IE<11 and for IE >= 11)
        * http://msdn.microsoft.com/en-us/library/ie/dn304886(v=vs.85).aspx
        */
        function getMSPointer(){
            var pointer;

            //IE >= 11
            if(window.PointerEvent){
                pointer = { down: "pointerdown", move: "pointermove", up: "pointerup"};
            }

            //IE < 11
            else{
                pointer = { down: "MSPointerDown", move: "MSPointerMove", up: "MSPointerUp"};
            }

            return pointer;
        }

        /**
        * Gets the pageX and pageY properties depending on the browser.
        * https://github.com/alvarotrigo/fullPage.js/issues/194#issuecomment-34069854
        */
        function getEventsPage(e){
            var events = new Array();
            if (window.navigator.msPointerEnabled){
                events['y'] = e.pageY;
                events['x'] = e.pageX;
            }else{
                events['y'] = e.touches[0].pageY;
                events['x'] =  e.touches[0].pageX;
            }

            return events;
        }

        /**
        * Getting the starting possitions of the touch event
        */
        function touchStartHandler(event){

            var e = event.originalEvent;
            var touchEvents = getEventsPage(e);
            touchStartY = touchEvents['y'];
        }

        /* Detecting touch events
        */
        function touchMoveHandler(event){
            var e = event.originalEvent;

            // additional: if one of the normalScrollElements isn't within options.normalScrollElementTouchThreshold hops up the DOM chain
            if (!checkParentForNormalScrollElement(event.target)) {
                event.preventDefault();

                var activeSection = $('.pp-section.active');
                var scrollable = isScrollable(activeSection);

                if (!isMoving()) {
                    var touchEvents = getEventsPage(e);
                    touchEndY = touchEvents['y'];
                    touchEndX = touchEvents['x'];

                  //$('body').append('<span style="position:fixed; top: 250px; left: 20px; z-index:88; font-size: 25px; color: #000;">touchEndY: ' + touchEndY  + '</div>');


                    //is the movement greater than the minimum resistance to scroll?
                    if (Math.abs(touchStartY - touchEndY) > (container.height() / 100 * options.touchSensitivity)) {
                        if (touchStartY > touchEndY) {
                            scrolling('down', scrollable);
                        } else if (touchEndY > touchStartY) {
                            scrolling('up', scrollable);
                        }
                    }
                }
            }
        }

        /**
         * recursive function to loop up the parent nodes to check if one of them exists in options.normalScrollElements
         * Currently works well for iOS - Android might need some testing
         * @param  {Element} el  target element / jquery selector (in subsequent nodes)
         * @param  {int}     hop current hop compared to options.normalScrollElementTouchThreshold
         * @return {boolean} true if there is a match to options.normalScrollElements
         */
        function checkParentForNormalScrollElement (el, hop) {
            hop = hop || 0;
            var parent = $(el).parent();

            if (hop < options.normalScrollElementTouchThreshold &&
                parent.is(options.normalScrollElements) ) {
                return true;
            } else if (hop == options.normalScrollElementTouchThreshold) {
                return false;
            } else {
                return checkParentForNormalScrollElement(parent, ++hop);
            }
        }


        /**
        * Creates a vertical navigation bar.
        */
        function addVerticalNavigation(){
            $('body').append('<div id="pp-nav"><ul></ul></div>');
            var nav = $('#pp-nav');

            nav.css('color', options.navigation.textColor);

            nav.addClass(options.navigation.position);

            for(var cont = 0; cont < $('.pp-section').length; cont++){
                var link = '';
                if(options.anchors.length){
                    link = options.anchors[cont];
                }
                if(typeof options.navigation.tooltips !== 'undefined'){
                    var tooltip = options.navigation.tooltips[cont];
                    if(typeof tooltip === 'undefined'){
                        tooltip = '';
                    }
                }

                nav.find('ul').append('<li data-tooltip="' + tooltip + '"><a href="#' + link + '"><span></span></a></li>');
            }

            nav.find('span').css('border-color', options.navigation.bulletsColor);
        }

        /**
        * Scrolls to the section when clicking the navigation bullet
        */
        $(document).on('click touchstart', '#pp-nav a', function(e){
            e.preventDefault();
            var index = $(this).parent().index();
            scrollPage($('.pp-section').eq(index));
        });

        /**
        * Navigation tooltips
        */
        $(document).on({
            mouseenter: function(){
                var tooltip = $(this).data('tooltip');
                $('<div class="pp-tooltip ' + options.navigation.position +'">' + tooltip + '</div>').hide().appendTo($(this)).fadeIn(200);
            },
            mouseleave: function(){
                $(this).find('.pp-tooltip').fadeOut(200, function() {
                    $(this).remove();
                });
            }
        }, '#pp-nav li');

         /**
         * Activating the website navigation dots according to the given slide name.
         */
        function activateNavDots(name, sectionIndex){
            if(options.navigation){
                $('#pp-nav').find('.active').removeClass('active');
                if(name){
                    $('#pp-nav').find('a[href="#' + name + '"]').addClass('active');
                }else{
                    $('#pp-nav').find('li').eq(sectionIndex).find('a').addClass('active');
                }
            }
        }

        /**
         * Activating the website main menu elements according to the given slide name.
         */
        function activateMenuElement(name){
            if(options.menu){
                $(options.menu).find('.active').removeClass('active');
                $(options.menu).find('[data-menuanchor="'+name+'"]').addClass('active');
            }
        }

        /**
        * Checks for translate3d support
        * @return boolean
        * http://stackoverflow.com/questions/5661671/detecting-transform-translate3d-support
        */
        function support3d() {
            var el = document.createElement('p'),
                has3d,
                transforms = {
                    'webkitTransform':'-webkit-transform',
                    'OTransform':'-o-transform',
                    'msTransform':'-ms-transform',
                    'MozTransform':'-moz-transform',
                    'transform':'transform'
                };

            // Add it to the body to get the computed style.
            document.body.insertBefore(el, null);

            for (var t in transforms) {
                if (el.style[t] !== undefined) {
                    el.style[t] = "translate3d(1px,1px,1px)";
                    has3d = window.getComputedStyle(el).getPropertyValue(transforms[t]);
                }
            }

            document.body.removeChild(el);

            return (has3d !== undefined && has3d.length > 0 && has3d !== "none");
        }

    };
})(jQuery);