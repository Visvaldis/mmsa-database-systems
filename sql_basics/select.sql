SELECT p.first_name, p.last_name,
	Floor(COUNT(o.person_id)/2) as total_orders,
	sum(oit.quantity) as total_items_bought,
	sum(it.price*oit.quantity-oit.discount) as total_money_spent
from person p
LEFT JOIN `order` o
on p.id = o.person_id
left join order_item oit
on oit.order_id = o.id
left join item it
on it.id = oit.item_id
GROUP by p.id