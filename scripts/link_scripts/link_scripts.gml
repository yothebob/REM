function get_next_node(_node){
	return _node.next_node;
}


function get_head_node(_link){
	return _link.head;
}

function get_tail_node(_link){
	return _link.tail;
}

function add_to_head_node(_link,_node){
	var old_head = _link.head;
	_link.head = _node;
	_node.next_node = old_head;
}

function print_list(_list){
	var current_node = _list.head;
	while (current_node){
		show_debug_message(current_node.post_values);
		var next_node = get_next_node(current_node);
		current_node = next_node;
	}
}

function add_node(_link,_node){
	if _link.tail != undefined{
		var old_tail = _link.tail;
		_link.tail = _node;
		old_tail.next_node = _link.tail;
		show_debug_message("added " + string(_node) + " to list" + string(old_tail))
	}
	else{
		_link.head = _node;
		_link.tail = _node;
		_node.next_node = _link.tail;
		show_debug_message("head: " + string(_link.head) + "head next node: " + string(_link.head.next_node) + string(_link.tail))
	}
}