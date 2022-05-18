Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40C252E3DE
	for <lists+linux-tegra@lfdr.de>; Fri, 20 May 2022 06:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345301AbiETEfZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 May 2022 00:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345292AbiETEfH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 May 2022 00:35:07 -0400
X-Greylist: delayed 942 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 May 2022 21:35:05 PDT
Received: from CN01-BJB-obe.outbound.protection.partner.outlook.cn (mail-bjbhn0101.outbound.protection.partner.outlook.cn [42.159.36.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F9111801B;
        Thu, 19 May 2022 21:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7wihFkvph7oO8mUlrfQXaLiX0FBlKUiG1N0pgoYP2iZWuqW8ov0wnoiW2894FKa/JN3tZDnnQUxRqcWARnyUeoJmnu93m3IyxcF20/4IgXUejvDHGpfkK5P+v/XdLPrrzjxZ6JMxlYdNT6fBiK46OzhvsJDx2E2fHhveiM8mfzJmQgAC3fs1QvrABHEjeL8n90y1l9/f1YxvQcZegie34OxwngJumeAVekm2Bae89rLaZ4kT4f/CV39L6sBo/0D5hcRzQZDqkjisIXB6Yro33f0knLzkRZIPobw/ag3eXAvVFPUPQ0UPBnKNTy3GpvpwG2WrVdbONIaY+tBSKNAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHa7Vpxtm/u3S4otqoZTmpXUuVJNGmaT4A6UJUMDuKo=;
 b=gNwCFZYWU+fOr/jy2dqu8uAdyORCWulW10Y3j+A9Yaz4uzW3BD1e9kLkqQ5opM3OTWTTuI79CPi2edVwMnJewq/uspXsZCDsbjz0HF4Z79eydIAxBTYEA+W3FQ1rJC4r2I/M0vu+dgAQCqCyDc9aDWvtIzb2J0j36nSPKvKV92IzhVr1lZwzfCFzGIvqssAm/+Vs/TxtCH8OtA4wp2dsqYkVBHcS8Jc0O06KpdYeCEygNXKdRCulIc1RdHva/uPblj0DNw5xGxatijSw9l/pVvoV3K7OyvkxgPpkk4X8MY4sL2XLxPK3hoIAg60s3C47Gl66CqgeWm6YhNsbc2yujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gientech.com; dmarc=pass action=none header.from=gientech.com;
 dkim=pass header.d=gientech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gientech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHa7Vpxtm/u3S4otqoZTmpXUuVJNGmaT4A6UJUMDuKo=;
 b=eV8XE+aPyST+gDsXH1Ey/uVqdkMn4TV3wKM4AwhsxPA61DasnesrpjmEJaMifLqQLanRA2+j1es6wW/7tJaHJiEdIIqfIaQSOT67W/23FE2lbTmtSrqAZ4zmiAbdVhZzHrKR5X73Cpxx90XqQAOdxRp09O33haH4cwvoeKX/g2pacuj2HUwxuf5q5Wp5taQvAw6VnHrY/htZIYDRMVMcEGyrFCmxqjhVvWBQ+0yUb0LwRIiMPrNIaSfvZAzegqwIFY3Pz5f5ucFfdyswUx4psmtSoKvgGMbByMPeOhbYpbY6M4l9h3PeZ0LbD4UWnj9odZuWHRVEmPEfJBwXO1TGRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gientech.com;
Received: from SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn (10.43.110.19) by
 SHXPR01MB0591.CHNPR01.prod.partner.outlook.cn (10.43.109.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Fri, 20 May 2022 04:19:20 +0000
Received: from SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn ([10.43.110.19])
 by SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn ([10.43.110.19]) with mapi
 id 15.20.5273.017; Fri, 20 May 2022 04:19:20 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Ree
To:     Recipients <cuidong.liu@gientech.com>
From:   "J Wu" <cuidong.liu@gientech.com>
Date:   Wed, 18 May 2022 21:19:17 +0000
Reply-To: contact@jimmywu.online
X-ClientProxiedBy: BJSPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (10.43.34.157) To SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn
 (10.43.110.19)
Message-ID: <SHXPR01MB0623D78B9C7A7763EC46B64D89D19@SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7c3224f-319c-4790-3035-08da39141e78
X-MS-TrafficTypeDiagnostic: SHXPR01MB0591:EE_
X-Microsoft-Antispam-PRVS: <SHXPR01MB059176145A86A087B365F8DB89D39@SHXPR01MB0591.CHNPR01.prod.partner.outlook.cn>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dOGpuj/SwPcPSxIbCLcD9S5VoOV06JFNXoILGtg2AtOpiBlGVtkbGu9LCE?=
 =?iso-8859-1?Q?Kff9go0TpEtMUBXJGvJx6QbEOscDVqzfVmPDAnlBGBsvn5NI11pxCpmiAf?=
 =?iso-8859-1?Q?3TPEVF+mgUNEsrL8P/yrMaQQtz29YQcvU75t0ovdKYv44ladJflj1aGBSq?=
 =?iso-8859-1?Q?kqRwx5cvoJKEyk8i9wvJNXDrkuegCm0Qv/4hhUms2nzStLGJS+eJwfj6mc?=
 =?iso-8859-1?Q?r53oij2TGwWd9fF0vp+g+zKJDg8hb9RD1jR1ZY4zfC0WY+cw2lPGuZC1I3?=
 =?iso-8859-1?Q?+40mQnQutXhi11Na48ayzNUj/P/9Yu9cDGYJx4AG1PIXVuS3crZrTAFCeP?=
 =?iso-8859-1?Q?obDYlxfjONwi7jP6nVounPSX+auNTaRLJHBl8pzqmijMHsKizKGe65eY+c?=
 =?iso-8859-1?Q?uk+HWibuEo1oXJGZnNnLUwfbRUwtmMp6MBF6opE90ZsjqBZpyTnaQIU/65?=
 =?iso-8859-1?Q?4wafVQTS75kTCkeu2ro5WgjPWZBkByBIadwCDO6L9O5AZx6m155HBBm17R?=
 =?iso-8859-1?Q?wYYJ19zGGI+KPkJW8VwEvt3RucchxfpfjPpGWPBrfWNYv4wHNglWY+bzWn?=
 =?iso-8859-1?Q?mRDi9Z6xHs2Xev63sovZDlBOiiTklJCKPI8m3SjkuntOy/eDY3jHP0UWYj?=
 =?iso-8859-1?Q?2M71r92gcz/rFf0HWi5tfTUqwQCYN977ROBjwA79n/XJo4B45C9oBiIZll?=
 =?iso-8859-1?Q?HG4kOvTz2p9BhMuhVIQws1F+C7T8ON3TLmIGbeMWNdqbYQrd+HI71G4Rm+?=
 =?iso-8859-1?Q?bg2JvRacX36oMxHzpYEOJsvZmjLSTyWeuxJO4Oz1W+Z0TbZz3hDm1VnSqC?=
 =?iso-8859-1?Q?E1gAu7c1Gk1FCZvYlymOv1lHWhCg9689eKBZhGzcAerkSMG1BgC7IyUDjE?=
 =?iso-8859-1?Q?wSl1+CfJ2qhq0HYbNOeu2ZC3SjLYM2NuA1f7M/BnREteNwOnE72HsIsKtc?=
 =?iso-8859-1?Q?Jp4S9eA9o869OLkjxaY0BlnvWxKF5lZyNrMe8uJ/e4wz9t0PUb37xs6Kwx?=
 =?iso-8859-1?Q?Kymi2tirt9CFVoMWiFHd7v+ln8Elv58Iaj0mxOQ3aPywzFOg8TFuPwMT1g?=
 =?iso-8859-1?Q?gg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230001)(366004)(8936002)(19618925003)(8676002)(6862004)(66946007)(558084003)(3480700007)(186003)(9686003)(4270600006)(7116003)(2906002)(6666004)(33656002)(40160700002)(7366002)(7406005)(7696005)(7416002)(66556008)(66476007)(38350700002)(508600001)(55016003)(38100700002)(86362001)(26005)(6200100001)(40180700001)(52116002)(62346012);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zkQGXtROrMcQvsRp73Qv+gsoibtDzKNlAR6Fhz+8nTMjqF1wt1H+85Ya1h?=
 =?iso-8859-1?Q?SbmdVCpdg5GR/UQ1mdrSKjJtQDFmdKTBprVpIKw0LMMCWBcaW3Yg4WbWWw?=
 =?iso-8859-1?Q?jRdhNaL7KNyMgIJZdy4bIL/KiMnZwn31vwp4Uq4MClb6Bcgwa4W0KUOZvB?=
 =?iso-8859-1?Q?Iak+dlbDroKMoiWKj6uzakl4oTMaNbVrpRlXJPL4bzNAC1eTJ8fIDAnhMy?=
 =?iso-8859-1?Q?Ucrs5sujYraEZ8ZscEM6gZIVos/fOO79eWABw/kQ5XbBJ+Dotge8PH04Zg?=
 =?iso-8859-1?Q?hQ9MH7gZen2hwHWFc8MTDTaVlKKV9ebAFaTtPI14b8Bn/jvIE5c6UW0FPQ?=
 =?iso-8859-1?Q?1kjyqx1A6PQoT9YkkibqhJn6MYm1y0HH5CTVrSn74h5LVoiuzLaa8qUbJw?=
 =?iso-8859-1?Q?uJ+973eWND71Jy8cBzs01kR+ALy3wvJ2x7o7B07P1OFrEL6H4IWZBiSJuR?=
 =?iso-8859-1?Q?xxAS6+qH7eOAgBrYRRNocC+REbMFecC2rpF6CJo4cMX0PztVnlPAgm0cVV?=
 =?iso-8859-1?Q?MFU2TCbXtwr6SBvncoQXieDW/DR1hSR02SA04WHs2pYuUrUzFC40sNyxOz?=
 =?iso-8859-1?Q?AfcwGvQWBiyDR2vWtUzAX0QUkCOg72nurhchNREzKYs7dl8VeY0CFxiALB?=
 =?iso-8859-1?Q?CLk3/pUZwgXEsd4co3P73VZ7g+9IEpzd6FKK1xDx06751pAVQHW68brRYS?=
 =?iso-8859-1?Q?HkJ3jlVra8BGbip/w0nDRH77Ep3IlV4ABuNhQu3V8/h2xBZ5fcgJ3R6FTp?=
 =?iso-8859-1?Q?HrQAlst+e3sKIkMTrWrLde9WmeUs8SlTLebjD5wj+hIJhFeFGhDtElv/gR?=
 =?iso-8859-1?Q?k2JoBebLy3Am6BX3vOgEMjT5//vl6iBUsT9iEAeSaSQwqXR0CnvF2Z8VIR?=
 =?iso-8859-1?Q?jfa9xQmEPy4abYtJXWM5e3MH9yna0pMeZZGKPRiygdx6rKPSCijuJ3TeBR?=
 =?iso-8859-1?Q?cgrz4BqTbpQoJ7P9ZeANF6PhmvFJHizt/ZvOXQo4lLgY4/jWgM7qEcjiQF?=
 =?iso-8859-1?Q?1vgfzkegr7VuUccfx422aBST204ObSwGPRcLJ2HRcKPHcqqq7/wCBxotjo?=
 =?iso-8859-1?Q?r9TmteAD29hiVFLoEmi1s9/Fq4SbORkDCOQR6Pbl7lva1q83kc1iDJeuH7?=
 =?iso-8859-1?Q?iM2LVwke62RKLYEkH1pshRCzvDz1yoheIlbfeI/+GCUwhNrOjHQu1/prHm?=
 =?iso-8859-1?Q?gj0DzdIrLkSzp6BJbZW0THHspCADYY05ZQjFz362XuUxIn3pnWfU75h+Tc?=
 =?iso-8859-1?Q?4BP3mbrJQYuSSLPk5tMNFAr6kHKSDom0h9/NI15PuB23SVsjdVL7xV0Jbc?=
 =?iso-8859-1?Q?zoL8OLZDm4UpMiz4idjjBeV9nx/NFT4/mmv87SPvU6K9ae4yZYmHlS6aAe?=
 =?iso-8859-1?Q?639gummOxgoc7pX7NNJ712AEueH6trmtFgVidLReSAQck7hBEJ77QH62rq?=
 =?iso-8859-1?Q?/CLwp5msXgOAZ5YVmAKNo+DPMOEJVJBbUcAkUAZQyd6qLJbfDr5Q7kLUPU?=
 =?iso-8859-1?Q?kRDC05xZLzf8GrjJj1oMdakjHXx89Qds7CjwPBhxBkVPfdkesT0iPDkSLc?=
 =?iso-8859-1?Q?hBJ8l4Vv4Kwc3SHGmo1PxWgk0j290WY/cABO4G6NgASMNa/nTpNHiQ56gx?=
 =?iso-8859-1?Q?T7LBFJuxLPRI1pTuDxpTWhn+HosYtI3l4OPSMx0QmYNUkqV6kitvxUGyHg?=
 =?iso-8859-1?Q?+fXYuEo6sXtYkU3nm0g7CcFlBZgjftBvRxxWvbDcc2n9oADMhbHtYXx+eZ?=
 =?iso-8859-1?Q?vneg=3D=3D?=
X-OriginatorOrg: gientech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c3224f-319c-4790-3035-08da39141e78
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0623.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 21:19:40.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 89592e53-6f9d-4b93-82b1-9f8da689f1b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOsHH6XSNDCC2HdXvvJfzmLD46TjNRaUl+SHyxCkxYEPQnCZH0LcYTTx8eP044CL3PtPIflVJZNby5YfDWEnKNkch5jgad+FnjeaqZc4nt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0591
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DATE_IN_PAST_24_48,
        DKIM_INVALID,DKIM_SIGNED,RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Can you do a job with me?
