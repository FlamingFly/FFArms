class FFA_W_DualSWModel29Weapon extends ScrnDual44Magnum;

var class<KFWeaponPickup> SinglePickupClass;

function DropFrom(vector StartLocation)
{
	local int m;
	local KFWeaponPickup Pickup;
	local int AmmoThrown, OtherAmmo;
	local KFWeapon SinglePistol;

	if( !bCanThrow )
		return;

	AmmoThrown = AmmoAmount(0);
	ClientWeaponThrown();

	for (m = 0; m < NUM_FIRE_MODES; m++)
	{
		if (FireMode[m].bIsFiring)
			StopFire(m);
	}

	if ( Instigator != None )
		DetachFromPawn(Instigator);

	if( Instigator.Health > 0 )
	{
		OtherAmmo = AmmoThrown / 2;
		AmmoThrown -= OtherAmmo;
		SinglePistol = KFWeapon(Spawn(DemoReplacement));
		SinglePistol.SellValue = SellValue / 2;
		SinglePistol.GiveTo(Instigator);
		SinglePistol.Ammo[0].AmmoAmount = OtherAmmo;
		SinglePistol.MagAmmoRemaining = MagAmmoRemaining / 2;
		MagAmmoRemaining = Max(MagAmmoRemaining-SinglePistol.MagAmmoRemaining,0);
	}

	Pickup = Spawn(SinglePickupClass,,, StartLocation);

	if ( Pickup != None )
	{
		Pickup.InitDroppedPickupFor(self);
		Pickup.DroppedBy = PlayerController(Instigator.Controller);
		Pickup.Velocity = Velocity;
		//fixing dropping exploit
		Pickup.SellValue = SellValue / 2;
		Pickup.Cost = Pickup.SellValue / 0.75; 
		Pickup.AmmoAmount[0] = AmmoThrown;
		Pickup.MagAmmoRemaining = MagAmmoRemaining;
		if (Instigator.Health > 0)
			Pickup.bThrown = true;
		//Log("--- Pickup "$String(Pickup)$" spawned with Cost = "$Pickup.Cost);
	}
	Destroy();
}

simulated function bool PutDown()
{
	if ( Instigator.PendingWeapon == none || Instigator.PendingWeapon.class == DemoReplacement )
	{
		bIsReloading = false;
	}

	return super.PutDown();
}

function bool HandlePickupQuery( pickup Item )
{
	if ( Item.InventoryType == DemoReplacement )
	{
		if( LastHasGunMsgTime < Level.TimeSeconds && PlayerController(Instigator.Controller) != none )
		{
			LastHasGunMsgTime = Level.TimeSeconds + 0.5;
			PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'KFMainMessages', 1);
		}

		return True;
	}

	return Super.HandlePickupQuery(Item);
}

defaultproperties
{
	Weight=4.000000
	Description="Dual S&W Model 29 ITEMDESC"
	ItemName="Dual S&W Model 29"
	FireModeClass(0)=Class'FFArms.FFA_W_DualSWModel29Fire'
	DemoReplacement=Class'FFArms.FFA_W_SWModel29Weapon'
	SinglePickupClass=Class'FFArms.FFA_W_SWModel29Pickup'
    PickupClass=Class'FFArms.FFA_W_DualSWModel29Pickup'
}