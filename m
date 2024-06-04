Return-Path: <linux-tegra+bounces-2538-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF138FA65E
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2024 01:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E777B2382A
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Jun 2024 23:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5895A83CB4;
	Mon,  3 Jun 2024 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U5EGqjGd"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE11E49B;
	Mon,  3 Jun 2024 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717456967; cv=none; b=hijEV2aiM+msmadS8BngXFRDYDfCnAKa7KQ3QTVGiZBpmBYaOKy2WGtnwcP9uYxlIKrtjh7+w0ILeo01mj8IciUD2KhUCT7PG7TcHJgu704FiQyelGlr7jdHDQyRGZfPha5MOLNaJGhre2ftAQS8eQGrmko3KRukn/epuAGrGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717456967; c=relaxed/simple;
	bh=4nnPRcl+QHvF8cHD3oo3FD0nWhbmVspa5R3NuXCR+sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=QQhMCgNIcxSoHZlQVd2fe3HA2qGjMpRiYzN8TAvol+nqT7VnStAmhs5T7QMJp6z7jlYaE9xf9sSdQxIDKoUPZK1xZjNb8XK+nhf7aDRFFKU9GsecxzLYL5hhcuY5gAIe3LBxG5Q+XdN4TfiJ+N2KRRbwJsk99BXYyBS/OvoIB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U5EGqjGd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453D260p031534;
	Mon, 3 Jun 2024 23:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dIZDgI+MnBLX7qt0dELaC9
	bnjOBSE4WoivnWsEYn/TU=; b=U5EGqjGdXpvWXYh5w4ngpfwUxi3XToAOiToGBB
	+KZp/NDESN8erLF4z1E+r/aGpPAVIs9R7bsJwHBZ+Iwrp4zwlPOrUXFPMqucz7Tn
	WkigJa6PwlmMY4BAv1HpVoDCkhSL6WQGu4i/96KxFcaoV5EPSvsCJPcjdJedjh5t
	psBDNSAYn93vvTkBKIuRRhNsWvLsgiH9N5IbMadHTN32YBaKk2ZCONOYvyaTts7h
	8Jdk3ClJu81Z+m4VoKhNVfWLpY0JxV1xoVLNb9BgHVYuHZW/afPQBqwC7FMWbz1r
	jiLYU9BWBB3eY5JeMMGaIJgYfbblbPgkVtvmDE2wO+H3xRtQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4bd7nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 23:22:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453NMc9B003052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 23:22:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 16:22:38 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 3 Jun 2024 16:22:37 -0700
Subject: [PATCH] hte: tegra-194: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240603-md-hte-tegra194-test-v1-1-83c959a0afdd@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADxQXmYC/x3MQQrCMBCF4auUWTuQxBCqVxEXaTNtBmyUmVQKp
 Xc3dve+xft3UBImhXu3g9CXld+lwV46GHMsMyGnZnDGeRPMFZeEuRJWmiXam29DK4bQO+uS9c5
 M0K4foYm3M/t4Ng9RCQeJZcz/2IvLuuEStZLAcfwAram1RIUAAAA=
To: Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC: <timestamp@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qJyYLZ-5Fy71dLIl0vHWTZrpxD47GSS5
X-Proofpoint-GUID: qJyYLZ-5Fy71dLIl0vHWTZrpxD47GSS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030189

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hte/hte-tegra194-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index 8ee038ccf601..df631b5100d2 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -235,4 +235,5 @@ static struct platform_driver tegra_hte_test_driver = {
 module_platform_driver(tegra_hte_test_driver);
 
 MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra HTE (Hardware Timestamping Engine) test driver");
 MODULE_LICENSE("GPL");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240603-md-hte-tegra194-test-668212d1420f


