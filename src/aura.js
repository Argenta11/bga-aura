/**
 *------
 * BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
 * Aura implementation : © <Your name here> <Your email address here>
 *
 * This code has been produced on the BGA studio platform for use on http://boardgamearena.com.
 * See http://en.boardgamearena.com/#!doc/Studio for more information.
 * -----
 *
 * aura.js
 *
 * Aura user interface script
 * 
 * In this file, you are describing the logic of your user interface, in Javascript language.
 *
 */

define([
    "dojo","dojo/_base/declare",
    "ebg/core/gamegui",
    "ebg/counter",
    "ebg/zone"
],
function (dojo, declare) {
    return declare("bgagame.aura", ebg.core.gamegui, {
        constructor: function(){
            console.log('aura constructor');

            this.zone = {};
            this.incremental_id = 1000;
        },
        
        /*
            setup:
            
            This method must set up the game user interface according to current game situation specified
            in parameters.
            
            The method is called each time the game interface is displayed to a player, ie:
            _ when the game starts
            _ when a player refreshes the game page (F5)
            
            "gamedatas" argument contains all datas retrieved by your "getAllDatas" PHP method.
        */
        
        setup: function(gamedatas)
        {
            console.log( "Starting game setup" );
            
            this.zone.deck = {};
            for (var player_id in gamedatas.players) {
                this.zone.deck[player_id] = this.createZone('deck', player_id);
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 0, 1, 0, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 1, 3, 12, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 2, 6, 23, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 3, 9, 25, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 4, 10, 42, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 0, null, 0, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 1, null, 12, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 2, null, 23, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 3, null, 25, dojo.body());
                this.createAndAddToZone(this.zone.deck[player_id], player_id, 4, null, 42, dojo.body());
            }
            
            // TODO: Set up your game interface here, according to "gamedatas"
            
 
            // Setup game notifications to handle (see "setupNotifications" method below)
            this.setupNotifications();

            console.log( "Ending game setup" );
        },
       

        ///////////////////////////////////////////////////
        //// Game & client states
        
        // onEnteringState: this method is called each time we are entering into a new game state.
        //                  You can use this method to perform some user interface changes at this moment.
        //
        onEnteringState: function( stateName, args )
        {
            console.log( 'Entering state: '+stateName );
            
            switch( stateName )
            {
            
            /* Example:
            
            case 'myGameState':
            
                // Show some HTML block at this game state
                dojo.style( 'my_html_block_id', 'display', 'block' );
                
                break;
           */
           
           
            case 'dummmy':
                break;
            }
        },

        // onLeavingState: this method is called each time we are leaving a game state.
        //                 You can use this method to perform some user interface changes at this moment.
        //
        onLeavingState: function( stateName )
        {
            console.log( 'Leaving state: '+stateName );
            
            switch( stateName )
            {
            
            /* Example:
            
            case 'myGameState':
            
                // Hide the HTML block we are displaying only during this game state
                dojo.style( 'my_html_block_id', 'display', 'none' );
                
                break;
           */
           
           
            case 'dummmy':
                break;
            }               
        }, 

        // onUpdateActionButtons: in this method you can manage "action buttons" that are displayed in the
        //                        action status bar (ie: the HTML links in the status bar).
        //        
        onUpdateActionButtons: function( stateName, args )
        {
            console.log( 'onUpdateActionButtons: '+stateName );
                      
            if( this.isCurrentPlayerActive() )
            {            
                switch( stateName )
                {
/*               
                 Example:
 
                 case 'myGameState':
                    
                    // Add 3 action buttons in the action status bar:
                    
                    this.addActionButton( 'button_1_id', _('Button 1 label'), 'onMyMethodToCall1' ); 
                    this.addActionButton( 'button_2_id', _('Button 2 label'), 'onMyMethodToCall2' ); 
                    this.addActionButton( 'button_3_id', _('Button 3 label'), 'onMyMethodToCall3' ); 
                    break;
*/
                }
            }
        },        

        ///////////////////////////////////////////////////
        //// Utility methods

        uniqueId : function() {
            this.incremental_id++;
            return this.incremental_id;
        },

        getCardHTMLId : function(id, player_id, color, value) {
            return ["card", value === null ? "back" : "front", "item_" + id, "player_" + player_id, "color_" + color, "value_" + value].join("__");
        },
        
        getCardHTMLClass : function(id, player_id, color, value) {
            return ["card", value === null ? "back" : "front", "item_" + id, "player_" + player_id, "color_" + color, "value_" + value].join(" ");
        },
        
        createCard : function(id, player_id, color, value) {
            var HTML_id = this.getCardHTMLId(id, player_id, color, value);
            var HTML_class = this.getCardHTMLClass(id, player_id, color, value);
            return "<div id='" + HTML_id + "' class='" + HTML_class + "'></div>";
        },

        createZone : function(location, player_id) {
            var div_id = location + "_" + player_id;

            var width = 55;
            var height = 75;
            dojo.style(div_id, 'width', width + 'px');
            dojo.style(div_id, 'height', height + 'px');

            var zone =  new ebg.zone();
            zone.create(this, div_id, width, height);
            zone.setPattern('grid');
            
            zone.player_id = player_id;

            return zone;
        },

        createAndAddToZone : function(zone, player_id, color, value, id, start) {
            if (id === null) {
                id = this.uniqueId();
            }
            var node = this.createCard(id, player_id, color, value);
            dojo.place(node, start);
            
            this.addToZone(zone, player_id, color, value, id);
        },

        addToZone : function (zone, player_id, color, value, id) {
            var HTML_id = this.getCardHTMLId(id, player_id, color, value);
            console.log(HTML_id);
            dojo.style(HTML_id, 'position', 'absolute')
            
            var weight = zone.items.length;
            dojo.style(HTML_id, 'z-index', weight)
            zone.placeInZone(HTML_id, weight);
        },


        ///////////////////////////////////////////////////
        //// Player's action
        
        /*
        
            Here, you are defining methods to handle player's action (ex: results of mouse click on 
            game objects).
            
            Most of the time, these methods:
            _ check the action is possible at this game state.
            _ make a call to the game server
        
        */
        
        /* Example:
        
        onMyMethodToCall1: function( evt )
        {
            console.log( 'onMyMethodToCall1' );
            
            // Preventing default browser reaction
            dojo.stopEvent( evt );

            // Check that this action is possible (see "possibleactions" in states.inc.php)
            if( ! this.checkAction( 'myAction' ) )
            {   return; }

            this.ajaxcall( "/aura/aura/myAction.html", { 
                                                                    lock: true, 
                                                                    myArgument1: arg1, 
                                                                    myArgument2: arg2,
                                                                    ...
                                                                 }, 
                         this, function( result ) {
                            
                            // What to do after the server call if it succeeded
                            // (most of the time: nothing)
                            
                         }, function( is_error) {

                            // What to do after the server call in anyway (success or failure)
                            // (most of the time: nothing)

                         } );        
        },        
        
        */

        
        ///////////////////////////////////////////////////
        //// Reaction to cometD notifications

        /*
            setupNotifications:
            
            In this method, you associate each of your game notifications with your local method to handle it.
            
            Note: game notification names correspond to "notifyAllPlayers" and "notifyPlayer" calls in
                  your aura.game.php file.
        
        */
        setupNotifications: function()
        {
            console.log( 'notifications subscriptions setup' );
            
            // TODO: here, associate your game notifications with local methods
            
            // Example 1: standard notification handling
            // dojo.subscribe( 'cardPlayed', this, "notif_cardPlayed" );
            
            // Example 2: standard notification handling + tell the user interface to wait
            //            during 3 seconds after calling the method in order to let the players
            //            see what is happening in the game.
            // dojo.subscribe( 'cardPlayed', this, "notif_cardPlayed" );
            // this.notifqueue.setSynchronous( 'cardPlayed', 3000 );
            // 
        },  
        
        // TODO: from this point and below, you can write your game notifications handling methods
        
        /*
        Example:
        
        notif_cardPlayed: function( notif )
        {
            console.log( 'notif_cardPlayed' );
            console.log( notif );
            
            // Note: notif.args contains the arguments specified during you "notifyAllPlayers" / "notifyPlayer" PHP call
            
            // TODO: play the card in the user interface.
        },    
        
        */
   });             
});
