from arm.logicnode.arm_nodes import *

class BoneFKNode(ArmLogicTreeNode):
    """Applies forward kinematics in the given object bone."""
    bl_idname = 'LNBoneFKNode'
    bl_label = 'Bone FK'
    arm_version = 1
    arm_section = 'armature'

    def init(self, context):
        super(BoneFKNode, self).init(context)
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('NodeSocketString', 'Bone')
        self.add_input('NodeSocketShader', 'Transform')

        self.add_output('ArmNodeSocketAction', 'Out')
