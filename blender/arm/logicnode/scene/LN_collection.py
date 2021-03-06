import bpy

from arm.logicnode.arm_nodes import *


class GroupNode(ArmLogicTreeNode):
    """Returns the objects of the given collection as an array.

    @seeNode Get Collection"""
    bl_idname = 'LNGroupNode'
    bl_label = 'Collection'
    arm_section = 'collection'
    arm_version = 1

    property0: PointerProperty(name='', type=bpy.types.Collection)

    def init(self, context):
        super(GroupNode, self).init(context)
        self.add_output('ArmNodeSocketArray', 'Array')

    def draw_buttons(self, context, layout):
        layout.prop_search(self, 'property0', bpy.data, 'collections', icon='NONE', text='')
