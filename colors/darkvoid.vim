lua << EOF
package.loaded['darkvoid'] = nil
package.loaded['darkvoid.config'] = nil
package.loaded['darkvoid.colorscheme'] = nil
package.loaded['darkvoid.init'] = nil
require('darkvoid').colorscheme()
EOF
