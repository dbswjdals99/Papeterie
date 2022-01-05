// DB 연결시키기 전에 테스트용 스크립트
function tempItem() {
	const fileName = window.location.href.match(/[^\/]+(?=\.)/)[0];

	function createTemplate() {
		const temp = document.createElement("template");
		const tempId = document.createAttribute("id");
		tempId.value = "item-template";
		temp.setAttributeNode(tempId);
		temp.innerHTML = "<li class='item'><div class='item-photo'><a>사진</a></div><div class='item-discount-percent'>할인율</div><h3 class='item-title'><a>상품명</a></h3><div class='item-original-value'><span>원래 가격</span></div><div class='item-value'><strong>가격</strong></div></li>";
		document.body.appendChild(temp);
	}
	createTemplate();

	function repeatItems(id, count) {
		const temp = document.getElementById("item-template");
		const list = document.getElementById(id).querySelector(".item-list");
		for (let i = 1; i <= count; i++) {
			const clone = document.importNode(temp.content, true);
			list.appendChild(clone);
		}
	}

	switch (fileName) {
		case "index":
			repeatItems("best", 4);
			repeatItems("new", 8);
			repeatItems("discount", 8);
			break;
		case "list":
		case "search":
			repeatItems("main-content", 16);
	}
}
tempItem();