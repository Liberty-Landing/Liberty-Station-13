// CAMERA

// An addition to deactivate which removes/adds the camera from the chunk list based on if it works or not.

/obj/machinery/camera/deactivate(user as mob, var/choice = 1)
	..(user, choice)
	invalidateCameraCache()
	if(src.can_use())
		cameranet.addCamera(src)
	else
		src.set_light(0)
		cameranet.removeCamera(src)

/obj/machinery/camera/New()
	..()
	//Camera must be added to global list of all cameras no matter what...
	if(cameranet.cameras_unsorted)
		cameranet.cameras += src
		cameranet.cameras_unsorted = 1
	else
		dd_insertObjectList(cameranet.cameras, src)
	update_coverage(1)

/obj/machinery/camera/Destroy()
	clear_all_networks()
	cameranet.cameras -= src
	. = ..()
