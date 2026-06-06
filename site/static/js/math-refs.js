document.addEventListener('DOMContentLoaded', function () {
  var refMap = {};

  var envTypeMap = {
    theorem:     'Theorem',
    lemma:       'Lemma',
    proposition: 'Proposition',
    corollary:   'Corollary',
    definition:  'Definition',
  };
  var envSel = Object.keys(envTypeMap).map(function (k) { return '.' + k; }).join(', ');
  var hasSections = document.querySelector('h2') !== null;
  var sectionNum = 0;
  var envCounter = 0;

  document.querySelectorAll('h2, ' + envSel).forEach(function (el) {
    if (el.tagName === 'H2') {
      var span = el.querySelector('.section-num');
      sectionNum = span ? parseInt(span.textContent.trim(), 10) : sectionNum + 1;
      envCounter = 0;
      return;
    }
    var typeName = null;
    Object.keys(envTypeMap).forEach(function (k) {
      if (el.classList.contains(k)) typeName = envTypeMap[k];
    });
    if (!typeName) return;
    envCounter++;
    var numStr = (hasSections && sectionNum > 0) ? sectionNum + '.' + envCounter : String(envCounter);
    var name = el.getAttribute('data-name');
    var labelText = typeName + ' ' + numStr + (name ? ' (' + name + ').' : '.');
    var strong = document.createElement('strong');
    strong.className = 'env-label';
    strong.textContent = labelText;
    el.insertBefore(strong, el.firstChild);
    el.setAttribute('data-numbered', '');
    if (el.id) {
      refMap[el.id] = { label: typeName + ' ' + numStr, href: '#' + el.id };
    }
  });

  var figN = 0;
  document.querySelectorAll('figure').forEach(function (fig) {
    var cap = fig.querySelector('figcaption');
    if (!cap) return;
    figN++;
    cap.textContent = 'Figure ' + figN + ': ' + cap.textContent;
    if (fig.id) {
      refMap[fig.id] = { label: 'Figure ' + figN, href: '#' + fig.id };
    }
  });

  var re = /\\([Cc])ref\{([^}]+)\}/g;

  var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, {
    acceptNode: function (node) {
      var p = node.parentElement;
      if (!p) return NodeFilter.FILTER_REJECT;
      var tag = p.tagName.toLowerCase();
      if (tag === 'script' || tag === 'style' || tag === 'code' || tag === 'pre') return NodeFilter.FILTER_REJECT;
      if (p.closest('mjx-container, .MathJax')) return NodeFilter.FILTER_REJECT;
      return /\\[Cc]ref\{/.test(node.textContent) ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT;
    }
  });

  var nodes = [];
  while (walker.nextNode()) nodes.push(walker.currentNode);

  nodes.forEach(function (node) {
    var text = node.textContent;
    var frag = document.createDocumentFragment();
    var last = 0;
    re.lastIndex = 0;
    var match;
    while ((match = re.exec(text)) !== null) {
      if (match.index > last) frag.appendChild(document.createTextNode(text.slice(last, match.index)));
      var ref = refMap[match[2]];
      if (ref) {
        var a = document.createElement('a');
        a.href = ref.href;
        a.className = 'cref-link';
        a.textContent = ref.label;
        frag.appendChild(a);
      } else {
        frag.appendChild(document.createTextNode(match[0]));
      }
      last = match.index + match[0].length;
    }
    if (last > 0) {
      if (last < text.length) frag.appendChild(document.createTextNode(text.slice(last)));
      node.parentNode.replaceChild(frag, node);
    }
  });
});
