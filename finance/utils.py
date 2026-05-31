
def compare_object_by_attr(prev_inst, new_inst, attr_list):
    for attr in attr_list:
        if getattr(prev_inst,attr) != getattr(new_inst,attr):
            return False
    return True
