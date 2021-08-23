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
	// _link = linked_list instance_id
	// _node = node instance_id
	var old_head = _link.head;
	_link.head = _node;
	_node.next_node = old_head;
}

function print_list(_link){
	// _link = linked_list instance_id
	var _current_node = _link.head;
	while (_current_node){
		show_debug_message(_current_node.post_values);
		var next_node = get_next_node(_current_node);
		_current_node = next_node;
	}
}

function add_node(_link,_node){
	// _link = linked_list instance_id
	// _node = node instance_id
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

function remove_node(_link,_node){
	// _node = instance_id
	show_debug_message("list before:");
	print_list(_link);
	var _previous_node = _link.head;
	var _current_node = _link.head;
	
	if _node == _link.head{//remove head
		var old_head = _link.head;
		_link.head = _node;
		_node.next_node = old_head.next_node;
		instance_destroy(old_head);
		show_debug_message("after list: ");
		print_list(_link);
		return;
	}
	
	while (_current_node){
		
		if _current_node == _node{
			if _current_node == _link.tail{
				_previous_node.next_node = _node;
				_link.tail = _node;
				show_debug_message("Erased " + string(_current_node) + string(_current_node.post_values));
				show_debug_message("after list: ");
				//print_list(_link);
				instance_destroy(_current_node);
				break;
			}
			_previous_node.next_node = _node;
			_node.next_node = _current_node;
			show_debug_message("Erased " + string(_current_node) + string(_current_node.post_values));
			show_debug_message("after list: ");
			//print_list(_link);
			instance_destroy(_current_node);
			break;
		}
		_previous_node = _current_node;
		_current_node = get_next_node(_current_node);
	}
	show_debug_message("after list: ");
	print_list(_link);
}