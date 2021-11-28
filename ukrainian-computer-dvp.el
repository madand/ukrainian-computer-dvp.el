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

;; ```text
;; 'ʼ 1! 2" 3№ 4; 5% 6: 7? 8* 9( 0) -_ =+
;;   Й  Ц  У  К  Е  Н  Г  Ш  Щ  З  Х  Ї
;;    Ф  І  В  А  П  Р  О  Л  Д  Ж  Є  Ґ
;;      Я  Ч  С  М  И  Т  Ь  Б  Ю  .,
;; ```

;;; TL;DR usage

;; Somehow install the package into your `load-path', and then:

;; ```elisp
;; (require 'ukrainian-computer-dvp)
;; (setq default-input-method 'ukrainian-computer-dvp)
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
;;   :custom (default-input-method 'ukrainian-computer-dvp)
;; ```

;; * https://github.com/jwiegley/use-package

;; #### `leaf.el'

;; This assumes the package is installed somewhere in the `load-path':

;; ```elisp
;; (leaf ukrainian-computer-dvp
;;   :require t
;;   :custom (default-input-method . 'ukrainian-computer-dvp)
;; ```

;; * https://github.com/conao3/leaf.el

;; #### `use-package'+`straight.el'

;; Single declaration that installs, loads and activates the package:

;; ```elisp
;; (use-package ukrainian-computer-dvp
;;   :straight (:host github :repo "madand/ukrainian-computer-dvp.el")
;;   :custom (default-input-method 'ukrainian-computer-dvp)
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
;;   :custom (default-input-method . 'ukrainian-computer-dvp)
;; ```

;; * https://github.com/conao3/leaf.el
;; * https://github.com/conao3/leaf-keywords.el
;; * https://github.com/raxod502/straight.el

;;; Code:

(require 'quail)

(quail-define-package
 "ukrainian-computer-dvp" "Ukrainian" "UK" nil
 "ЙЦУКЕН Ukrainian for Programmer Dvorak layout."
 nil t t t nil nil nil nil nil nil t)

;; 'ʼ 1! 2" 3№ 4; 5% 6: 7? 8* 9( 0) -_ =+
;;   Й  Ц  У  К  Е  Н  Г  Ш  Щ  З  Х  Ї
;;    Ф  І  В  А  П  Р  О  Л  Д  Ж  Є  Ґ
;;      Я  Ч  С  М  И  Т  Ь  Б  Ю  .,

(quail-define-rules

 ("$" ?') ("~" ?ʼ)
 ("&" ?1) ("%" ?!)
 ("[" ?2) ("7" ?\")
 ("{" ?3) ("5" ?№)
 ("}" ?4) ("3" ?\;)
 ("(" ?5) ("1" ?%)
 ("=" ?6) ("9" ?:)
 ("*" ?7) ("0" ??)
 (")" ?8) ("2" ?*)
 ("+" ?9) ("4" ?\()
 ("]" ?0) ("6" ?\))
 ("!" ?-) ("8" ?_)
 ("#" ?=) ("`" ?+)

 (";" ?й) (":" ?Й)
 ("," ?ц) ("<" ?Ц)
 ("." ?у) (">" ?У)
 ("p" ?к) ("P" ?К)
 ("y" ?е) ("Y" ?Е)
 ("f" ?н) ("F" ?Н)
 ("g" ?г) ("G" ?Г)
 ("c" ?ш) ("C" ?Ш)
 ("r" ?щ) ("R" ?Щ)
 ("l" ?з) ("L" ?З)
 ("/" ?х) ("?" ?Х)
 ("@" ?ї) ("^" ?Ї)

 ("a" ?ф) ("A" ?Ф)
 ("o" ?і) ("O" ?І)
 ("e" ?в) ("E" ?В)
 ("u" ?а) ("U" ?А)
 ("i" ?п) ("I" ?П)
 ("d" ?р) ("D" ?Р)
 ("h" ?о) ("H" ?О)
 ("t" ?л) ("T" ?Л)
 ("n" ?д) ("N" ?Д)
 ("s" ?ж) ("S" ?Ж)
 ("-" ?є) ("_" ?Є)
 ("\\" ?ґ) ("|" ?Ґ)

 ("'" ?я) ("\"" ?Я)
 ("q" ?ч) ("Q" ?Ч)
 ("j" ?с) ("J" ?С)
 ("k" ?м) ("K" ?М)
 ("x" ?и) ("X" ?И)
 ("b" ?т) ("B" ?Т)
 ("m" ?ь) ("M" ?Ь)
 ("w" ?б) ("W" ?Б)
 ("v" ?ю) ("V" ?Ю)
 ("z" ?.) ("Z" ?,))

(provide 'ukrainian-computer-dvp)

;;; ukrainian-computer-dvp.el ends here
