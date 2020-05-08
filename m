Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653541CA9D0
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2020 13:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgEHLm6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 May 2020 07:42:58 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57406 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgEHLm6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 May 2020 07:42:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048BbhYJ042794;
        Fri, 8 May 2020 11:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=HFdRmpu5jurrGV09UZbVaS/kuFUzL0y7LA7cyHmxBOo=;
 b=tv8JrdgpVBhzpYS38pSwvyzTIkvHpdHu8lCYYGS6VmQdPM/KOPZ+nzRGUUyq40AGt65K
 VteoO8gWUPgQaY8/Ig3RSWkoBnDcYwJ3clEdG9/EJO8481ck0SADhxwns1Y1ubLlqNii
 Fx/X+cyEJDp1PZTha5b21NyXlVQ8vAshuUrL/lGpJv1qW8JFterj5u+SMPMMvXbz7JfY
 x+aVEAu7p0xfYk7T2AOpbt6iUprwDlhI3mIEJo1T85aK6uJnMTajGSW4XPXZ07fb64++
 qkXEPXtbCjOk6zwZ4kxwufOQSRJe0EAn8AOdHWm+2FtieKCv3Ou3vWzh61VAQ1c93hgs kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 30vtewtgvf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 May 2020 11:42:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048BauKS063434;
        Fri, 8 May 2020 11:42:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 30vtdnednk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 May 2020 11:42:54 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 048BgrI5014523;
        Fri, 8 May 2020 11:42:53 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 08 May 2020 04:42:52 -0700
Date:   Fri, 8 May 2020 14:42:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] memory: tegra: Delete some dead code
Message-ID: <20200508114246.GA334755@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080102
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The debugfs_create_dir() function never returns NULL and anyway the
correct behavior is to ignore errors in this situation.  The
debugfs_create_file() will become a no-op if "emc->debugfs.root" is an
error pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memory/tegra/tegra186-emc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 97f26bc77ad41..7c904e9bba8e8 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -241,11 +241,6 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
-	if (!emc->debugfs.root) {
-		dev_err(&pdev->dev, "failed to create debugfs directory\n");
-		return 0;
-	}
-
 	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
 			    emc, &tegra186_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
-- 
2.26.2

