;;; ukrainian-computer-dvp.el --- ЙЦУКЕН Ukrainian input method for Programmer Dvorak layout  -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Andriy B. Kmit'

;; Author: Andriy B. Kmit' <dev@madand.net>
;; Keywords: languages, i18n
;; URL: https://github.com/madand/ukrainian-computer-dvp.el
;; Package-Requires: ((emacs "23.1"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package defines new Emacs input method `ukrainian-computer-dvp'. This is
;; an adaptation of `ukrainian-computer' for the Programmer Dvorak keyboard
;; layout.

;;; TL;DR usage

;; Somehow install the package into your `load-path', and then:

;; ```elisp
;; (require 'ukrainian-computer-dvp)
;; (set-input-method 'ukrainian-computer-dvp t)
;; ```

;;; Installation

;; #### Manual Installation

;; Download the file `ukrainian-computer-dvp.el` from this repo and put it
;; somewhere in your `load-path'.

;; ```shell
;; # Download the latest version of the package
;; mkdir -p ~/path/to/ukrainian-computer-dvp
;; cd ~/path/to/ukrainian-computer-dvp
;; wget -q 'https://github.com/madand/ukrainian-computer-dvp.el/raw/master/ukrainian-computer-dvp.el'

;; # Alternatively, clone the whole repo.
;; git clone 'https://github.com/madand/ukrainian-computer-dvp.elgit' ~/path/to/ukrainian-computer-dvp
;; ```

;; Now update the load path in your `init.el':

;; ```elisp
;; (add-to-load-path (expand-file-name "~/path/to/ukrainian-computer-dvp"))
;; ```

;; #### Installation with `straight.el'

;; ```elisp
;; (straight-use-package '(ukrainian-computer-dvp
;;                         :host github
;;                         :repo "madand/ukrainian-computer-dvp.el"))
;; ```

;; * https://github.com/raxod502/straight.el

;;; Loading with a helper

;; #### `use-package'

;; This assumes the package is installed somewhere in the `load-path':

;; ```elisp
;; (use-package ukrainian-computer-dvp
;;   :config (set-input-method 'ukrainian-computer-dvp t))
;; ```

;; * https://github.com/jwiegley/use-package

;; #### `leaf.el'

;; This assumes the package is installed somewhere in the `load-path':

;; ```elisp
;; (leaf ukrainian-computer-dvp
;;   :require t
;;   :config (set-input-method 'ukrainian-computer-dvp t))
;; ```

;; * https://github.com/conao3/leaf.el

;; #### `use-package'+`straight.el'

;; Single declaration that installs, loads and activates the package:

;; ```elisp
;; (use-package ukrainian-computer-dvp
;;   :straight (:host github :repo "madand/ukrainian-computer-dvp.el")
;;   :config (set-input-method 'ukrainian-computer-dvp t))
;; ```

;; * https://github.com/jwiegley/use-package
;; * https://github.com/raxod502/straight.el

;; #### `leaf.el'+`leaf-keywords.el'+`straight.el'

;; Single declaration that installs, loads and activates the package:

;; ```elisp
;; (leaf ukrainian-computer-dvp
;;   :straight (ukrainian-computer-dvp :host github
;;                                           :repo "madand/ukrainian-computer-dvp.el")
;;   :require t
;;   :config (set-input-method 'ukrainian-computer-dvp t))
;; ```

;; * https://github.com/conao3/leaf.el
;; * https://github.com/conao3/leaf-keywords.el
;; * https://github.com/raxod502/straight.el

;;; Code:

(require 'quail)

(quail-define-package
 "ukrainian-computer-dvp" "Ukrainian" "UK" nil
 "ЙЦУКЕН Ukrainian for Programmer Dvorak layout."
 nil t t t t nil nil nil nil nil t)

;;  ' 1! 2" 3№ 4; 5% 6: 7? 8* 9( 0) -_ =+
;;   Й  Ц  У  К  Е  Н  Г  Ш  Щ  З  Х  Ї
;;    Ф  І  В  А  П  Р  О  Л  Д  Ж  Є  Ґ
;;      Я  Ч  С  М  И  Т  Ь  Б  Ю  .,

(quail-define-rules
 ("&" ?1)
 ("[" ?2)
 ("{" ?3)
 ("}" ?4)
 ("(" ?5)
 ("=" ?6)
 ("*" ?7)
 (")" ?8)
 ("+" ?9)
 ("]" ?0)
 ("!" ?-)
 ("#" ?=)
 ("$" ?')
 (";" ?й)
 ("," ?ц)
 ("." ?у)
 ("p" ?к)
 ("y" ?е)
 ("f" ?н)
 ("g" ?г)
 ("c" ?ш)
 ("r" ?щ)
 ("l" ?з)
 ("/" ?х)
 ("@" ?ї)
 ("a" ?ф)
 ("o" ?і)
 ("e" ?в)
 ("u" ?а)
 ("i" ?п)
 ("d" ?р)
 ("h" ?о)
 ("t" ?л)
 ("n" ?д)
 ("s" ?ж)
 ("-" ?є)
 ("'" ?я)
 ("q" ?ч)
 ("j" ?с)
 ("k" ?м)
 ("x" ?и)
 ("b" ?т)
 ("m" ?ь)
 ("w" ?б)
 ("v" ?ю)
 ("z" ?.)
 ("%" ?!)
 ("7" ?\")
 ("5" ?№)
 ("3" ?\;)
 ("1" ?%)
 ("9" ?:)
 ("0" ??)
 ("2" ?*)
 ("4" ?\()
 ("6" ?\))
 ("8" ?_)
 ("`" ?+)
 ("~" ?')
 (":" ?Й)
 ("<" ?Ц)
 (">" ?У)
 ("P" ?К)
 ("Y" ?Е)
 ("F" ?Н)
 ("G" ?Г)
 ("C" ?Ш)
 ("R" ?Щ)
 ("L" ?З)
 ("?" ?Х)
 ("^" ?Ї)
 ("A" ?Ф)
 ("O" ?І)
 ("E" ?В)
 ("U" ?А)
 ("I" ?П)
 ("D" ?Р)
 ("H" ?О)
 ("T" ?Л)
 ("N" ?Д)
 ("S" ?Ж)
 ("_" ?Є)
 ("\"" ?Я)
 ("Q" ?Ч)
 ("J" ?С)
 ("K" ?М)
 ("X" ?И)
 ("B" ?Т)
 ("M" ?Ь)
 ("W" ?Б)
 ("V" ?Ю)
 ("Z" ?,)
 ("\\" ?ґ)
 ("|" ?Ґ))

(provide 'ukrainian-computer-dvp)

;;; ukrainian-computer-dvp.el ends here
