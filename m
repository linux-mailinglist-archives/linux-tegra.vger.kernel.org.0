Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655D12C003F
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Nov 2020 07:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgKWGsE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Nov 2020 01:48:04 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:16257 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGsE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Nov 2020 01:48:04 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201123064801epoutp02fd5c01d254d7c1fe84a6706f010ec618~KED9qyhJe0955309553epoutp02g
        for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2020 06:48:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201123064801epoutp02fd5c01d254d7c1fe84a6706f010ec618~KED9qyhJe0955309553epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606114081;
        bh=huO/DzlWXqHKtGTBqiOhR7mqW/ABbdb9hkVOQAK47aI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=HLKk/+fVwHveW6qT52oIvAfSJg9Jc954lJ72TQDlTRx2txiuN+d/hYYyBnjSqh+FM
         RJ2vSjRvbYpJfEvJRl2g8596+gX8IuceeNvslMJtMdta0Gn380bAXBHA9KXbnQhJ2k
         hqqUbGW9A8K29n8+ZmkVg6++Q4fU4PjR60AsMfGc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201123064801epcas1p156a2230fe89d187f98a9e4d2b909a29e~KED9GdV6M0116501165epcas1p1o;
        Mon, 23 Nov 2020 06:48:01 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Cfd5B3NG2zMqYkj; Mon, 23 Nov
        2020 06:47:58 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C1.C1.63458.E1B5BBF5; Mon, 23 Nov 2020 15:47:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201123064757epcas1p37d2d540ba70cd4ad107d4442b58599e1~KED6OzJgg0264502645epcas1p3F;
        Mon, 23 Nov 2020 06:47:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201123064757epsmtrp271e2c012cb93f1be7a489f1751cea718~KED6NwXer1092710927epsmtrp2-;
        Mon, 23 Nov 2020 06:47:57 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-0a-5fbb5b1eae96
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CB.4D.13470.D1B5BBF5; Mon, 23 Nov 2020 15:47:57 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201123064757epsmtip2bdaaee5bf25ff7e246f8f3ba49fba7dd~KED5vTpQB2156421564epsmtip2I;
        Mon, 23 Nov 2020 06:47:57 +0000 (GMT)
Subject: Re: [PATCH v10 09/19] PM / devfreq: tegra30: Support interconnect
 and OPPs from device-tree
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <f8f0b254-b5d6-7951-7576-846d8f58cb13@samsung.com>
Date:   Mon, 23 Nov 2020 16:02:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-10-digetx@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGJsWRmVeSWpSXmKPExsWy7bCmrq5c9O54g9knxC3efXrKarH642NG
        iytf37NZTN+7ic2iZdYiFovz5zewW2x9uobJ4mzTG3aLy7vmsFl87j3CaNH5ZRabxcVTrha3
        G1ewWUxaO5XR4uwzb4vWvUfYLf5d28hi8XPXPBaLzQ+OsTkIe7y/0crusXPWXXaPS+f+MHts
        WtXJ5nHn2h42j/vdx5k8epvfsXn0bVnF6PF5k1wAZ1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8
        c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QU0oKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OIS
        W6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7Iy9P3pYCs5zVMx++YWpgbGXvYuRk0NC
        wERi7uudbF2MXBxCAjsYJd5cWskM4XxilDiwfRdU5hujxM+nHXAta081QFXtZZRo/vSbHcJ5
        zyhx628PSxcjB4ewQJrE6Tl1IHERgZssEstX/GMDiTMLVEls+uMNMohNQEti/4sbbCA2v4Ci
        xNUfjxlBbF4BO4kPM2eygNgsAqoSxw58YQKxRQXCJE5ua4GqEZQ4OfMJWA2ngLnEol+XWUFs
        ZgFxiVtP5jNB2PIS29/OATtUQqCfU+LhlhOsEB+4SGzffBrqG2GJV8e3QNlSEp/f7WWDsKsl
        Vp48wgbR3MEosWX/BahmY4n9SyczQTyjKbF+lz5EWFFi5++5jBCL+STefe1hBSmREOCV6GgT
        gihRlrj84C4ThC0psbi9k20Co9IsJO/MQvLCLCQvzEJYtoCRZRWjWGpBcW56arFhgRFybG9i
        BCd4LbMdjJPeftA7xMjEwXiIUYKDWUmEt1VuZ7wQb0piZVVqUX58UWlOavEhRlNgAE9klhJN
        zgfmmLySeENTI2NjYwsTQzNTQ0Mlcd4/2h3xQgLpiSWp2ampBalFMH1MHJxSDUytOedCRDeV
        tctf1uPjWHP2F8Oecnkemx0fJcwm5T77LHfW+v5ipQ8815/rsrZyPA5J/jL/iUD/WU31oChR
        h5ZG5RtWolZLNoeFrrnldFYgYOIPt8s/vOY9t5q+8cxj26xn2+omiWdYzP1fy/NsrsD2gjMV
        976uD39gZ5QQ8EtE25lhkumn5iWqnMr1s49sMcn2m3CtWsNfbq5fG7Oj7vpi0VObRN/ZqP/Z
        EJj8NX5C8c0Ea8mybumw1Wq3u7hvv9KTOR99LUxVepLk1pctbtItiarmmY6l738xXVp8N/Z6
        Q9kJ1w3772ox/nkmITp7zun2GmlZ/8Uy6XN+z1spP6PSrOqm3i6L/7FzGBduVFRiKc5INNRi
        LipOBADsVN6NeQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsWy7bCSvK5s9O54gxfP9C3efXrKarH642NG
        iytf37NZTN+7ic2iZdYiFovz5zewW2x9uobJ4mzTG3aLy7vmsFl87j3CaNH5ZRabxcVTrha3
        G1ewWUxaO5XR4uwzb4vWvUfYLf5d28hi8XPXPBaLzQ+OsTkIe7y/0crusXPWXXaPS+f+MHts
        WtXJ5nHn2h42j/vdx5k8epvfsXn0bVnF6PF5k1wAZxSXTUpqTmZZapG+XQJXxt4fPSwF5zkq
        Zr/8wtTA2MvexcjJISFgIrH2VAMziC0ksJtRYvuJUoi4pMS0i0eB4hxAtrDE4cPFXYxcQCVv
        GSV6t/xjBKkRFkiT+LduAyNIQkTgLovEpB+32EASzAJVEgvXLmaD6NjGKPHr2AFWkASbgJbE
        /hc3wIr4BRQlrv54DDaJV8BO4sPMmSwgNouAqsSxA1+YQGxRgTCJnUseM0HUCEqcnPkErIZT
        wFxi0a/LrBDL1CX+zLvEDGGLS9x6Mp8JwpaX2P52DvMERuFZSNpnIWmZhaRlFpKWBYwsqxgl
        UwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgmNdS3MH4/ZVH/QOMTJxMB5ilOBgVhLhbZXb
        GS/Em5JYWZValB9fVJqTWnyIUZqDRUmc90bhwjghgfTEktTs1NSC1CKYLBMHp1QDk5RPesT/
        BW6saxNL9K8c3BWYEsKazsITFa4pKpO+KvBfdGHz7Y5tSuk5Cxe0tde+Sua+Vbe08Ol/6ems
        SQ8Wrzs+b9Lc90teC+e2WP0TfRwpO0G5vHFRw6Q07r8S0X97kp4e3/sk7HvF5fLknPnl97wt
        vsvNSlfaY8o/5dh56wXfkuYH/O9iU7uwlbX1avabfoaNQq7eDFZ7L544sCUwqkNps+iTNSKc
        L27tFJ09+8hjJpbc3MPa66wd07Tme80tz3l49fMG9W97dFdFbn8n1WvOdH5aY1Ewszlfb3vo
        jXW757Pd9Z2oGnlz6j7GbrZ/CuVC8+wsKh6828V9XEJG7U10n3GYNoe3iFD+Qpn/SizFGYmG
        WsxFxYkAQMqhAmQDAAA=
X-CMS-MailID: 20201123064757epcas1p37d2d540ba70cd4ad107d4442b58599e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201123003325epcas1p1b90c7b94507a3d58053949f5395c885a
References: <20201123002723.28463-1-digetx@gmail.com>
        <CGME20201123003325epcas1p1b90c7b94507a3d58053949f5395c885a@epcas1p1.samsung.com>
        <20201123002723.28463-10-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On 11/23/20 9:27 AM, Dmitry Osipenko wrote:
> This patch moves ACTMON driver away from generating OPP table by itself,
> transitioning it to use the table which comes from device-tree. This
> change breaks compatibility with older device-trees and brings support
> for the interconnect framework to the driver. This is a mandatory change
> which needs to be done in order to implement interconnect-based memory
> DVFS, i.e. device-trees need to be updated. Now ACTMON issues a memory
> bandwidth requests using dev_pm_opp_set_bw() instead of driving EMC clock
> rate directly.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 79 +++++++++++++++----------------
>  1 file changed, 37 insertions(+), 42 deletions(-)
> 

(snip)

When the patches related to icc are merged, I'll merge patch9/10.
Thanks for your work.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
