var totalRow = 0
var category = ''
var totalPage = 0
var perPage = 8
var currentPage = 1

function initPage(event, totalRows, inputCategory) {
    totalRow = totalRows
    category = inputCategory
    loadPage(event, totalRow)
}

function loadPage(event, totalRow) {
    generatePagebar(totalRow, perPage)
    addevents()
    reloadPage(1, 8)
    controlPageBar(1)
}

function dispTagList(productNo, event) {
    var itemDiv = document.querySelector("#product-" + productNo)
    var tagDiv = document.querySelector("#product-tag-" + productNo)
    itemDiv.style.display = "none"
    tagDiv.style.display = "block"
    event.preventDefault()
}

function addevents() {
    for (var i = 1; i <= totalPage; i++) {
        document.querySelector('#page-' + i).addEventListener('click',
            movePage.bind(event, i))
    }

}

function dispItem(productNo, event) {
    var itemDiv = document.querySelector("#product-" + productNo)
    var tagDiv = document.querySelector("#product-tag-" + productNo)
    itemDiv.style.display = "block"
    tagDiv.style.display = "none"
    event.preventDefault()
}

var movePage = function(targetPage, event) {
    currentPage = targetPage

    var startRow = 1 + ((targetPage - 1) * perPage)
    var endRow = targetPage * perPage
    reloadPage(startRow, endRow)
    controlPageBar(targetPage)

}

function generatePagebar(totalRow, perPage) {
    totalPage = Math.ceil(totalRow / perPage)
    var pageBar = document.querySelector("#pageBar")
    var prevBtn = document.createElement('li')
    var prevLink = document.createElement('a')
    var nextBtn = document.createElement('li')
    var nextLink = document.createElement('a')

    prevBtn.setAttribute('class', 'page-item')
    prevBtn.setAttribute('id', 'prev')
    prevBtn.setAttribute('style', 'display:block')

    prevLink.setAttribute('class', 'page-link')

    prevLink.textContent = '이전'
    prevBtn.appendChild(prevLink)
    nextBtn.setAttribute('class', 'page-item')
    nextBtn.setAttribute('id', 'next')
    nextBtn.setAttribute('style', 'display:block')
    nextLink.setAttribute('class', 'page-link')

    nextLink.textContent = '다음'
    nextBtn.appendChild(nextLink)
    pageBar.appendChild(prevBtn)
    for (var i = 1; i <= totalPage; i++) {
        var numBtn = document.createElement('li')
        var numLink = document.createElement('a')
        numBtn.setAttribute('class', 'page-item')
        numLink.setAttribute('class', 'page-link')
        numLink.setAttribute('id', 'page-' + i)

        numLink.textContent = '' + i
        numBtn.appendChild(numLink)
        pageBar.appendChild(numBtn)
    }

    pageBar.appendChild(nextBtn)
}

function controlPageBar(targetPage) {
    document.querySelectorAll('#pagebar .page-item')

    for (var i = i; i <= totalPage; i++) {
        var pagebtn = document.querySelector('#page-' + i)
        pagebtn.removeAttribute('class')
        if (i == targetPage) {
            pagebtn.setAttribute('class', 'page-link active')
        } else {
            pagebtn.setAttribute('class', 'page-link')
        }
    }
    var prevBtn = document.querySelector('#prev')
    var nextBtn = document.querySelector('#next')
    if (1 == targetPage && prevBtn) {
        prevBtn.style.display = 'none'
    } else {
        if (prevBtn.style.display) {
            prevBtn.style.display = 'block'
            var prevLink = document.querySelector('#prev a')
            prevLink.onclick = null
            prevLink.onclick = movePage.bind(event,currentPage-1)
        }
    }

    if (totalPage == targetPage && nextBtn) {
        nextBtn.style.display = 'none'
    } else {
        if (nextBtn.style.display) {
            nextBtn.style.display = 'block'
            var nextLink = document.querySelector('#next a')
            nextLink.onclick = null
            nextLink.onclick = movePage.bind(event,currentPage+1)
        }
    }
}

function reloadPage(startRow, endRow) {

    var xhr = new XMLHttpRequest()

    var url = 'getPagenateData.jsp?category=' + category + '&startRow=' +
        startRow + '&endRow=' + endRow


    var i = 1
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var text = xhr.responseText
            var products = JSON.parse(text)
            xhr.responseText = ""
            buildProductList(products)

        }
    }
    xhr.open("get", url)
    xhr.send()
}

function buildProductList(products) {
    document.querySelectorAll('#product-list div').forEach(
        function (curr) {
            curr.remove()
        })
    products.forEach(function (curr) {
        var tags = curr.tags
        var productList = document.querySelector('#product-list')
        var listbox = document.createElement('div')
        listbox.setAttribute('class', 'col-3 list-box')
        var card = document.createElement('div')
        card.setAttribute('class', 'card')
        card.setAttribute('id', 'product-' + curr.no)
        card.setAttribute('style', 'height: 340px; display:block; ')
        var cardBody = document.createElement('div')
        cardBody.setAttribute('class', 'card-body')
        var cardTitle = document.createElement('h6')
        cardTitle.setAttribute('class', 'card-title text-center')
        cardTitle.innerHTML = curr.name + '<hr />'
        var tagArea = document.createElement('div')
        tagArea.setAttribute('class', 'card-text text-center')
        var tagList = document.createElement('ul')
        tagList.setAttribute('style',
            'list-style: none; text-align: left;font-size: 8px;')
        tagList.setAttribute('id', 'tag-list-' + curr.no)

        if (tags.length > 2) {

            for (var i = 0; i < 2; i++) {

                var tag = document.createElement('li')
                tag.setAttribute('style', 'display:inline;')
                var tag1 = document.createElement('a')
                tag1.setAttribute('href', 'search.jsp?tag=' +
                    curr.tags[i].substring(1))
                tag1.innerHTML = tags[i]
                tag.appendChild(tag1)
                tagList.appendChild(tag)
            }
            var dot3li = document.createElement('li')
            dot3li.setAttribute('style', 'display: inline;')
            var dot3a = document.createElement('a')
            dot3a.setAttribute('href', 'javascript:;')
            dot3a.textContent = '...'
            dot3a.addEventListener('click', function (event) {
                var itemDiv = document.querySelector("#product-" +
                    curr.no)
                var tagDiv = document.querySelector("#product-tag-" +
                    curr.no)
                itemDiv.style.display = "none"
                tagDiv.style.display = "block"
               	listbox.setAttribute('class','no');
                event.preventDefault()
            })
            // dot3a.onclick=dispTagList(curr.no,event)
            dot3li.appendChild(dot3a)
            tagList.appendChild(dot3li)

        } else {
            for (var i = 0; i < tags.length; i++) {

                var tag = document.createElement('li')
                tag.setAttribute('style', 'display:inline;')
                var tag1 = document.createElement('a')
                tag1.setAttribute('href', 'search.jsp?tag=' +
                    curr.tags[i].substring(1))
                tag1.innerHTML = tags[i]
                tag.appendChild(tag1)
                tagList.appendChild(tag)
            }
        }
        var buyBtnDiv = document.createElement('div')
        buyBtnDiv.setAttribute('class', 'card-text text-center')
        var buyBtnA = document.createElement('a')
        buyBtnA.setAttribute('href', 'detail.jsp?productNo=' + curr.no)
        buyBtnA.setAttribute('class', 'btn btn-primary btn-sm')
        buyBtnA.textContent = '구매'
        buyBtnDiv.appendChild(buyBtnA)
        var imgA = document.createElement('a')
        imgA.setAttribute('href','detail.jsp?productNo=' + curr.no)
        var imgTag = document.createElement('img')
        imgTag.setAttribute('class', 'card-img-top')
        var imagePath = "ICECREAM" == curr.category ? 'ICECREAM/' :
            'CAKE/'
        imagePath += curr.imagePath
        imgTag.setAttribute('src', '../image/' + imagePath)
        imgA.appendChild(imgTag)
        tagArea.appendChild(tagList)
        cardTitle.appendChild(tagArea)
        cardBody.appendChild(cardTitle)
        cardBody.appendChild(buyBtnDiv)
        cardBody.appendChild(imgA)
        card.appendChild(cardBody)
        listbox.appendChild(card)

        if (tags.length > 2) {
            var tagCard = document.createElement('div')
            tagCard.setAttribute('id', 'product-tag-' + curr.no)
            tagCard.setAttribute('class', 'card')
            tagCard.setAttribute('style',
                'height: 340px; width:217px; margin:15px; font-size: 8px; display: none;')

            var tagCardBody = document.createElement('div')
            tagCardBody.setAttribute('class', 'card-body')
            
            var tagUl = document.createElement('ul')
            tagUl.setAttribute('style','list-style:none;padding:0px;');
            
            curr.tags.forEach(function (tag) {
                var tagLi = document.createElement('li')
                var tagA = document.createElement('a')
                tagA.setAttribute('href', 'search.jsp?tag=' +
                    tag.substr(1))
                tagA.textContent = tag
                tagLi.appendChild(tagA)
                tagUl.appendChild(tagLi)
            })
            var closeBtn = document.createElement('button')
            closeBtn.setAttribute('class', 'btn btn-secondary btn-sm')
            closeBtn.textContent = '뒤로'
            closeBtn.addEventListener('click', function (event) {
                var itemDiv = document.querySelector("#product-" +
                    curr.no)
                var tagDiv = document.querySelector("#product-tag-" +
                    curr.no)
                itemDiv.style.display = "block"
                	listbox.setAttribute('class','col-3 list-box');
                tagDiv.style.display = "none"
               
                event.preventDefault
            })

            tagCardBody.appendChild(tagUl)
            tagCardBody.appendChild(closeBtn)
            tagCard.appendChild(tagCardBody)
            productList.appendChild(tagCard)
        }

        productList.appendChild(listbox)

    })
}
