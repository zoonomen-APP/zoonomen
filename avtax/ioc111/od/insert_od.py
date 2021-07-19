import re
import sys

def make_url_dict(filename):
    with open(filename) as f:
        content = f.readlines()
    
    url_dict = {}
    for line in content:
        line = line.replace('\n', '')
        *name, url = line.split(' ')
        name = [n for n in name if (n != '') and (n!= 'qq')]
        name = ' '.join(name)
        if 'http' in url:
            url_dict[name] = url
    return url_dict

def insert_links(root_name):
    url_dict = make_url_dict(f'./{root_name}.od')
    output_lines = []
    ods_used = []
    no_od_found = []
    
    with open(f'./{root_name}.html') as f:
        content = f.readlines()
        
    for line in content:
        
        if ('<li>' in line) and ('<ref>' not in line):
            if '<a' in line:
                end_index = line.index('<a')
            else:
                end_index = None

            name = line[0:end_index].strip()
            to_del = ['<b>', '</b>', '&#8224;', '<li>', '(']
            for d in to_del:
                name = name.replace(d, '')
            name = name.strip()
            if name in url_dict:
                url = url_dict[name]
                ods_used.append(name)
            else:
                no_od_found.append(name)
                # print out that we do not have OD URL for given taxon
                url = None
        
        html_wayne_class = 'class="from-wayne"'
        if ('</li>' in line) and ('<ref>' not in line) and (html_wayne_class not in line):
            if re.match('^\t', line):
                line_start = '\n\t'
            else:
                line_start = '\n'
            if url:
                url_string = f'{line_start}<a {html_wayne_class} href="{url}" target="new">O.D.</a>'
                idx = line.index('</li>')
                line = line[:idx] + url_string + line[idx:]
        
        output_lines.append(line)
        
    ods_not_used = [key for key in url_dict if key not in ods_used]
    
    with open(f'./{root_name}_with_od.html', 'w') as f:
        for l in output_lines:
            f.write(l)
    
    with open(f'./p_error/{root_name}_unused_od.txt', 'w') as f:
        for l in ods_not_used:
            f.write(f'{l}\n')
            
    with open(f'./p_error/{root_name}_no_od.txt', 'w') as f:
        for l in no_od_found:
            f.write(f'{l}\n')


insert_links(sys.argv[1])
