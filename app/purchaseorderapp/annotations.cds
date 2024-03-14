using ibmcapapp.srv.CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields :[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Boost',
            Action : 'ibmcapapp.srv.CatalogService.boost',
            Inline : true
        },
        {
            $Type : 'UI.DataField',
            Criticality : Criticality,
            CriticalityRepresentation: #WithIcon,
            Value : OverallStatus,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Purchase Order',
        TypeNamePlural:'Purchase Orders',
        Title:{Value:PO_ID},
        Description: {Value:PARTNER_GUID.COMPANY_NAME},
        ImageUrl:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommunity.sap.com%2Ft5%2Ftechnology-blogs-by-sap%2Fsap-cloud-application-programming-model-cap-start-here%2Fba-p%2F13370128&psig=AOvVaw3tZsD5Xq_7ILclbjwZvuJO&ust=1710252064452000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCLiajcmv7IQDFQAAAAAdAAAAABAE'
    },
    UI.Facets:[
        {
            $Type:'UI.CollectionFacet',
            Label:'More Details',
            Facets:[
                {
                    $Type:'UI.ReferenceFacet',
                    Label:'More Info',
                    Target:'@UI.Identification'
                },
                {
                    $Type:'UI.ReferenceFacet',
                    Label:'Pricing ',
                    Target:'@UI.FieldGroup#Spiderman'
                },
                {
                    $Type:'UI.ReferenceFacet',
                    Label:'Status',
                    Target:'@UI.FieldGroup#Superman'
                }
            ],
        },
        {
            $Type:'UI.ReferenceFacet',
            Target:'Items/@UI.LineItem',
            Label : 'PO Items',
        }
    ],
    UI.Identification:[
        {
            $Type:'UI.DataField',
            Value:PO_ID
        },
        {
            $Type:'UI.DataField',
            Value:PARTNER_GUID_NODE_KEY,
        },
        {
           
            $Type:'UI.DataField',
            Value:NODE_KEY, 
        }
    ],
    UI.FieldGroup #Spiderman:{
        Data:[
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT
            }
        ]
    },
    UI.FieldGroup #Superman:{
        Data:[
            {
                $Type: 'UI.DataField',
                Value: CURRENCY_code
            },
            {
                $Type: 'UI.DataField',
                Value: OVERALL_STATUS
            },
            {
                $Type: 'UI.DataField',
                Value: LIFECYCLE_STATUS
            }
        ]
    }
);

annotate service.PurchaseOrderItems with @(
    UI.LineItem:[
        {
            $Type:'UI.DataField',
            Value:PO_ITEM_POS,
        },
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT,
        },
        {
            $Type:'UI.DataField',
            Value:CURRENCY_code,
        },
    ]
);
