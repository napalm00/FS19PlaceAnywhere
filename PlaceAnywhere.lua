-- PlaceAnywhere mod by naPalm
-- Override code by scfmod (https://github.com/napalm00/FS19PlaceAnywhere/issues/2)

PlaceAnywhere = {}; 
local overrideAreaOwnerCheck = false
local dismissTerrainDeformation = false

function PlaceAnywhere:loadMap(name)

    PlacementScreenController.DISPLACEMENT_COST_PER_M3 = 1; -- Edit this to change the terrain modification cost per cubic meter (game default: 50)
    Landscaping.SCULPT_BASE_COST_PER_M3 = 1; -- Edit this to change the landscaping cost per cubic meter (game default: 50)

    PlacementUtil.hasObjectOverlap = Utils.overwrittenFunction(PlacementUtil.hasObjectOverlap, PlaceAnywhere.hasObjectOverlap);
    PlacementUtil.isInsidePlacementPlaces = Utils.overwrittenFunction(PlacementUtil.isInsidePlacementPlaces, PlaceAnywhere.isInsidePlacementPlaces);
    PlacementUtil.isInsideRestrictedZone = Utils.overwrittenFunction(PlacementUtil.isInsideRestrictedZone, PlaceAnywhere.isInsideRestrictedZone);
    PlacementUtil.hasOverlapWithPoint = Utils.overwrittenFunction(PlacementUtil.hasOverlapWithPoint, PlaceAnywhere.hasOverlapWithPoint);
    --TerrainDeformation.setOutsideAreaConstraints = Utils.overwrittenFunction(TerrainDeformation.setOutsideAreaConstraints, PlaceAnywhere.setOutsideAreaConstraints); causes crash and is useless?
    TerrainDeformation.setDynamicObjectCollisionMask = Utils.overwrittenFunction(TerrainDeformation.setDynamicObjectCollisionMask, PlaceAnywhere.setDynamicObjectCollisionMask);

    --Placeable.setPlaceablePreviewState = Utils.overwrittenFunction(Placeable.setPlaceablePreviewState, PlaceAnywhere.setPlaceablePreviewState);

    PlacementScreenController.onTerrainValidationFinished = Utils.overwrittenFunction(PlacementScreenController.onTerrainValidationFinished, PlaceAnywhere.onTerrainValidationFinished);
    TerrainDeformation.setBlockedAreaMap = Utils.overwrittenFunction(TerrainDeformation.setBlockedAreaMap, PlaceAnywhere.setBlockedAreaMap);

    -- override area owner check
    PlacementScreenController.isPlacementValid = Utils.overwrittenFunction(PlacementScreenController.isPlacementValid, PlaceAnywhere.isPlacementValid);
    -- override area owner check for landscaping
    Landscaping.isModificationAreaOnOwnedLand = Utils.overwrittenFunction(Landscaping.isModificationAreaOnOwnedLand, PlaceAnywhere.isModificationAreaOnOwnedLand);

    -- override terrain deformation
    Placeable.addPlaceableLevelingArea = Utils.overwrittenFunction(Placeable.addPlaceableLevelingArea, PlaceAnywhere.addPlaceableLevelingArea);
    Placeable.addPlaceableRampArea = Utils.overwrittenFunction(Placeable.addPlaceableRampArea, PlaceAnywhere.addPlaceableRampArea);
end; 

function PlaceAnywhere:addPlaceableLevelingArea(superFunc, ...)
    if dismissTerrainDeformation then
        return true
    else
        return superFunc(self, ...)
    end
end

function PlaceAnywhere:addPlaceableRampArea(superFunc, ...)
    if dismissTerrainDeformation then
        return true
    else
        return superFunc(self, ...)
    end
end

function PlaceAnywhere:isPlacementValid(superFunc, ...)
    if overrideAreaOwnerCheck then
        return true
    else
        return superFunc(self, ...)
    end
end

function PlaceAnywhere:isModificationAreaOnOwnedLand(superFunc, ...)
    if overrideAreaOwnerCheck then
        return true
    else
        return superFunc(self, ...)
    end
end

function PlaceAnywhere:keyEvent(u, sym, m, i)
    if i and sym == Input.KEY_0 then
        dismissTerrainDeformation = not dismissTerrainDeformation
    elseif i and sym == Input.KEY_8 then
        overrideAreaOwnerCheck = not overrideAreaOwnerCheck
    end
end

function PlaceAnywhere:deleteMap()
end; 

function PlaceAnywhere:mouseEvent(posX, posY, isDown, isUp, button) 
end; 

function PlaceAnywhere:update(dt) 
end; 

function PlaceAnywhere:draw(PlaceAnywhere)
end; 

function PlaceAnywhere:setBlockedAreaMap(superFunc, ...)
    return true;
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

--function PlaceAnywhere:setPlaceablePreviewState(superFunc, ...)      
--    self.maxSlope = 1.3089969389957; -- (radians) equivalent to 75deg
--    self.maxEdgeAngle = 0.5235987755983; -- (radians) equivalent to 30deg
--    self.maxSmoothDistance = 20;
--    return superFunc(self, ...);
--end

addModEventListener(PlaceAnywhere);