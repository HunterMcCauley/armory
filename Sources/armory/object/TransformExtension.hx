package armory.object;

import iron.math.Mat4;
import iron.math.Vec4;
import iron.math.Quat;
import iron.object.Transform;

class TransformExtension {

	public static function overlap(t1: Transform, t2: Transform): Bool {
		return t1.worldx() + t1.dim.x / 2 > t2.worldx() - t2.dim.x / 2 && t1.worldx() - t1.dim.x / 2 < t2.worldx() + t2.dim.x / 2 &&
			   t1.worldy() + t1.dim.y / 2 > t2.worldy() - t2.dim.y / 2 && t1.worldy() - t1.dim.y / 2 < t2.worldy() + t2.dim.y / 2 &&
			   t1.worldz() + t1.dim.z / 2 > t2.worldz() - t2.dim.z / 2 && t1.worldz() - t1.dim.z / 2 < t2.worldz() + t2.dim.z / 2;
	}

	/**
	 * Returns the world (global) position.
	 * @return Vec4
	 */
	public static inline function getWorldPosition(t: Transform): Vec4 {
		return new Vec4(t.worldx(), t.worldy(), t.worldz(), 1.0);
	}

	/**
	 * Returns the given local vector in world coordinates
	 * @param localVec
	 * @return Vec4
	 */
	public static inline function getWorldVecFromLocal(t: Transform, localVec: Vec4): Vec4 {
		return localVec.clone().applymat4(t.worldUnpack);
	}
	/**
	 * Returns the given world vector in local coordinates
	 * @param worldVec
	 * @return Vec4
	 */
	public static inline function getLocalVecFromWorld(t: Transform, worldVec: Vec4): Vec4 {
		return worldVec.clone().applymat4(Mat4.identity().getInverse(t.worldUnpack));
	}
	/**
	* Returns the given world vector in transform orientation
	* @param worldVec
	* @return Vec4
	**/
	public static inline function worldVecToOrientation(t: Transform, worldVec: Vec4): Vec4 {
		return t.right().mult(worldVec.x).add(t.look().mult(worldVec.y)).add(t.up().mult(worldVec.z));
	}
}
