import os
import nltk
from nltk.stem import WordNetLemmatizer
import re
from bs4 import BeautifulSoup
from markdown import markdown

def markdown_to_text(markdown_string):
    """ Converts a markdown string to plaintext """

    # md -> html -> text since BeautifulSoup can extract text cleanly
    html = markdown(markdown_string)

    # remove code snippets
    html = " ".join(html.splitlines())
    html = re.sub(r'<pre>.*?</pre>', ' ', html)
    html = re.sub(r'<code>.*?</code>', ' ', html)
    html = re.sub(r'```.*?```', ' ', html)

    # extract text
    soup = BeautifulSoup(html, "html.parser")
    text = ''.join(soup.findAll(text=True))

    # remove special chars
    text = re.sub(r'[^a-zA-Z0-9 \n\.]', '', text)

    return text

def get_nouns(text_string):
    nltk.download('punkt')
    nltk.download('averaged_perceptron_tagger')
    toks = nltk.word_tokenize(text_string)
    pos = nltk.pos_tag(toks) 
    nouns = sorted(list(set([w[0] for w in pos if w[1] == 'NNS' or w[1] == 'NN'])))
    return nouns

#def get_uniquestem_nouns(nouns):
#    nltk.download('wordnet')
#    lem = WordNetLemmatizer()
#    stems = []
#    for w in nouns:
#        try:
#            stems.append(lem.lemmatize(w))
#        except:
#            pass
#
#    unqstems = set(stems)
#    return unqstems

def get_rmds(path):
    return [fn for fn in os.listdir(path) if '.Rmd' in fn]


rmdpath = '../'
rmdfiles = get_rmds(rmdpath)

for fn in rmdfiles:

    print('')
    print('')
    print('')
    print('RMD: ' + str(fn))

    f = open(os.path.join(rmdpath, fn), 'r')
    raw_rmd_code = ''.join(f.readlines())
    f.close()

    text = markdown_to_text(raw_rmd_code)

    nouns = get_nouns(text)

    print(nouns)
