;; YieldMax
;; <add a description here>

;; constants
;;

;; data maps and vars
;;
;; title: asset

;; private functions
;;
;; Define error constants ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-constant err-not-authorized (err u100))
(define-constant err-token-exists (err u101))
(define-constant err-token-not-found (err u102))
(define-constant err-insufficient-funds (err u103))
(define-constant err-invalid-token-name (err u104))
(define-constant err-invalid-category (err u105))
(define-constant err-invalid-max-supply (err u106))
(define-constant err-invalid-token-price (err u107))
(define-constant err-invalid-recipient (err u108))
(define-constant err-invalid-transfer-amount (err u109))
(define-constant err-insufficient-allowance (err u110))
(define-constant err-invalid-authorized-addr (err u111))
(define-constant err-invalid-price-update (err u112))


;; Counter for token IDs
(define-data-var token-counter uint u0)
(define-data-var contract-admin principal tx-sender)

;;;;;;; MAP ;;;;;;;
;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;
;; Define the token structure
(define-map tokens
  { token-id: uint }
  {
    token-name: (string-ascii 64),
    token-category: (string-ascii 32),
    max-supply: uint,
    token-price: uint,
    last-price-update: uint  ;; Added timestamp for price updates
  }
)


;; Define balances structure
(define-map balances
  { holder: principal, token-id: uint }
  { amount: uint }
)


;; Define allowance structure
(define-map allowances
  { holder: principal, authorized: principal, token-id: uint }
  { allowed-amount: uint }
)

