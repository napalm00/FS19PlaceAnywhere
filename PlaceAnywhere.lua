-- PlaceAnywhere mod by naPalm

PlaceAnywhere = {}; 

function PlaceAnywhere:loadMap(name)

    PlacementScreenController.DISPLACEMENT_COST_PER_M3 = 1; -- Edit this to change the terrain modification cost per cubic meter (game default: 50)

    PlacementUtil.hasObjectOverlap = Utils.overwrittenFunction(PlacementUtil.hasObjectOverlap, PlaceAnywhere.hasObjectOverlap);
    PlacementUtil.isInsidePlacementPlaces = Utils.overwrittenFunction(PlacementUtil.isInsidePlacementPlaces, PlaceAnywhere.isInsidePlacementPlaces);
    PlacementUtil.isInsideRestrictedZone = Utils.overwrittenFunction(PlacementUtil.isInsideRestrictedZone, PlaceAnywhere.isInsideRestrictedZone);
    PlacementUtil.hasOverlapWithPoint = Utils.overwrittenFunction(PlacementUtil.hasOverlapWithPoint, PlaceAnywhere.hasOverlapWithPoint);
    PlacementUtil.markPlaceUsed = Utils.overwrittenFunction(PlacementUtil.markPlaceUsed, PlaceAnywhere.markPlaceUsed);
    TerrainDeformation.setOutsideAreaConstraints = Utils.overwrittenFunction(TerrainDeformation.setOutsideAreaConstraints, PlaceAnywhere.setOutsideAreaConstraints);
    TerrainDeformation.setDynamicObjectCollisionMask = Utils.overwrittenFunction(TerrainDeformation.setDynamicObjectCollisionMask, PlaceAnywhere.setDynamicObjectCollisionMask);
    
    PlacementScreenController.onTerrainValidationFinished = Utils.overwrittenFunction(PlacementScreenController.onTerrainValidationFinished, PlaceAnywhere.onTerrainValidationFinished);
    TerrainDeformation.setBlockedAreaMap = Utils.overwrittenFunction(TerrainDeformation.setBlockedAreaMap, PlaceAnywhere.setBlockedAreaMap);
end; 

function PlaceAnywhere:deleteMap()
end; 

function PlaceAnywhere:mouseEvent(posX, posY, isDown, isUp, button) 
end; 

function PlaceAnywhere:keyEvent(unicode, sym, modifier, isDown) 
end; 

function PlaceAnywhere:update(dt) 
end; 

function PlaceAnywhere:draw(PlaceAnywhere)
end; 

function PlaceAnywhere:setBlockedAreaMap(superFunc, ...)
    return true;
end

function PlaceAnywhere:createRestrictedZone(superFunc, ...)
    return superFunc(self, ...);
end

function PlaceAnywhere:hasObjectOverlap(superFunc, ...)   
    return false;
end

function PlaceAnywhere:isInsidePlacementPlaces(superFunc, ...)   
    return false;
end

function PlaceAnywhere:isInsideRestrictedZone(superFunc, ...)   
    return false;
end

function PlaceAnywhere:hasOverlapWithPoint(superFunc, ...)   
    return false;
end

function PlaceAnywhere:setOutsideAreaConstraints(superFunc, ...)   
    return superFunc(self, 0, 0, 0);
end

function PlaceAnywhere:setDynamicObjectCollisionMask(superFunc, ...)   
    return superFunc(self, 0);
end

function PlaceAnywhere:onTerrainValidationFinished(superFunc, p1, p2, p3)      
    return superFunc(self, 0, p2, p3);
end

addModEventListener(PlaceAnywhere);