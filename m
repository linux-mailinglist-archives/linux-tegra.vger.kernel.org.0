Return-Path: <linux-tegra+bounces-577-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3468428EC
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jan 2024 17:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CA131C21192
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jan 2024 16:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF5886ADE;
	Tue, 30 Jan 2024 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cVOjUsC4"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18886151
	for <linux-tegra@vger.kernel.org>; Tue, 30 Jan 2024 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706631301; cv=fail; b=Egk+442UkXYE1MansV6pjgkphvsXv2SrTnFJT1LbtQv4UsP3eyw+8rMMP2pYnTT4rUE7G/o6oJgE7mY/m6OLqR/92U2+oW7SgkeigwID71KVej1AQrusds9DcCYle5MrFmQXtbUl2NLDjDmc8Yx+PM87nE/0ms5/6eyzD+VBAQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706631301; c=relaxed/simple;
	bh=keFbF0p3grefKLijPudv/8mq6+aZOw/7+mxT75v5Dpo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k9ClDv9kpkSXjIrkfg+6VIQ5oL0f0FLY7CwaQGH76D3otx3vsbTUMKWKItlC3Q2YPFeFm+xnkJ3POfRhzG9hm8aAzSb2noirza9kWBX8oTcEumAatP+RCK+s7biaBO277NFcsfqUVRCjDuK7Xk1hJnylM589LwyG/9F3Bd9A5/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cVOjUsC4; arc=fail smtp.client-ip=40.107.100.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYYeR+lSZh+txhaqyII/MvRojq0w8pl2LicSHuEx0Lei9F01HXBhFdxTIrMkF1FXpNiMsrdOUhBst3om0Y3Z2wro47DB80/sA2hlLwHVJTzMsz0R31NS/mnXqJn7i2ba2ar1XN9TtcU7SYftuJrG0aPQCC2LqV7ozSR7udx5QA0giW6xVFlVZPL9M4ChQpSs8eWDtg3rHzykcPyCL5l2+0pRlRgHmNyFAuJg2nPFUhsRHFmqj0fYfPmFtupfCW3HGs/PnW1OM+5zjGuiF404nN5kF9R/9tbbYAZ9Jz2rrpt6sCOM9FKxoP2Uo0FZ19p9RW1SeS++cuqbnkD8LavR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvesRyr+e/rXJNrCAhQxslda+E0CAVRP550uO1iH9AE=;
 b=U5pc6G8fDvV4I8KHZzQ8bf1y/uGe7blnJrsLA6H8XQMDS5y1Ph84HuvVh+m4M20f4M2zvg+DaTyHn5ZD5ZKH4P7ntG5i39YDgtZD4wIc52hyTTz7+b9bONpvod7o7JKfWqCz/MCdhSj10Xm2wckWQyX24+1Iv8yeCT1wiy2tnr86pMtHIoFQ/CySuuSQMUTsY0KBOU5a2ieaCW/OotHZNUWArx1QABOlACyGPYCzZlqe15XO3/RtCFmhoV2jKV2DyJZhTDeKN3pRoZCeVcuSyPDOQn3WXk4PKKqcXyJMvwTEvr8IF/OJoc9bBNquxoxSboZcXXKiI/KpznLrfuPh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvesRyr+e/rXJNrCAhQxslda+E0CAVRP550uO1iH9AE=;
 b=cVOjUsC4+1wAbSIwdy61A3hQ+ZGzLeJWorniUVq277+jX0iqWGmK1Sx7CXxgxxmcH9HI0+zdpObWH1LU0j28VTUrKV0M/7hcoCzfTpgd3F9LTawgCLt6zcs3Rh5AeXJ/vcYb+krSwjTRmkDACICNf3Vu8s70226auzRwIgejUVoli95pwpHoJ8UO2Sp3QSqm8LeSrpOaYwqAj5giqncP+mm5xGaV/ZiJ8ssnICQm2k5CClnc5akzF389TVNCn5Z2xR5u1VT1TLWQ+qqor7L0GO3Aswh0NGHf1KC4zbLhzVNxFg7TgWRGRyTulHrNVT1yCbYEcRdzwkUZc5GWTIuOQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM3PR12MB9287.namprd12.prod.outlook.com (2603:10b6:8:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 16:14:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 16:14:56 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	diogo.ivo@tecnico.ulisboa.pt,
	Joerg Roedel <jroedel@suse.de>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	patches@lists.linux.dev
Subject: [PATCH rc] drm/tegra: Do not assume that a NULL domain means no DMA IOMMU
Date: Tue, 30 Jan 2024 12:14:54 -0400
Message-ID: <0-v1-3049f92c4812+16691-host1x_def_dom_fix_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0053.namprd16.prod.outlook.com
 (2603:10b6:208:234::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM3PR12MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 2536ad06-9984-48a7-4bb7-08dc21ae9958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73uVtuGISD8E6xq67AjGCwMCfElPzVvscJsxLmoPgGhJ3zAjkbBYBMUj/8Rw1gTQdThrM/e+Ht1JWRHKL/RwOdyzcwPMyMC94Nmjvg495kIc1dmQrZfxhQmORX14/ZxOE1xCqi55O+V5uvzne1SxKX7Im2st14E5R7SyxasAzCxqh9IyxKJ6+Jd6gT0tpJkShP8sOfU9PzQGjdSQ+hWb0W2gQhX3lq4dCe6JRu/Qb983ahQg2osNWcflNCUuL0T6R59II9Z/tvR0nWdyS0Abbig6isaSi9jCnA7ro9th+Bm0dXRqI+q+Pcax4438vO5DCuWniiOVYm+hUUQx5qjdW33SQOICrowqGiu+mHyw/ACUbShWWDWzoKE6z74/hG4xh8AuIjL1WnaaSJmk1TPDY9Cm6vH4lHhwsqrWm2DMXbsj+s2Y/suUxjNLE9QaNUokIO1f18dyDscdT6zm1E82gaGRFRvYk+4nYOZPbCaYIgwuxIyo1aQgSshgb6ryoIIUkJDNHqM8nqj6w4D2pt2OGZ6pAcAOeslFK92r/fRHG5eU0AfSydZi9oKSV+IBq8pbHmfC1uOQcIrFcx63YsasiNVtMI7KZpbnaQDg9cy7mtxySnTerpU38XCZ6NhTe+cMnmwZOtO22ibQt3xfOMpSOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(38100700002)(66946007)(110136005)(316002)(6506007)(54906003)(966005)(6486002)(66476007)(8676002)(8936002)(6512007)(5660300002)(2616005)(7416002)(86362001)(4326008)(478600001)(26005)(2906002)(36756003)(66556008)(83380400001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5qVP7rSdD6xneamU6p5i019osV/OYXhLCGsN5difI/OdEPr8qA2/AZaoV4cJ?=
 =?us-ascii?Q?qx/VdE9CcQntU062y58ES8Prd9H/OFcQuyhs2JflQa9mfYdUQY82LDl2jtC3?=
 =?us-ascii?Q?/j/komMXttAITlnoJl1GqYG+txDYFSRWhbIq7XWjVnIgXetEoMt/cvRE4e9/?=
 =?us-ascii?Q?gZ2VVBWuhdhsxdauRhuGrcP+UNChHo8sSZFUp91k6x2XPEnFQ69m/OPlZLlr?=
 =?us-ascii?Q?onnbIQmWlamxNNxRCjSgsl4Jt5nLEvV2mmFbHLiHX1VyCVKF6LQZb9eSUXSn?=
 =?us-ascii?Q?HwhMGmB+Tg7gaq0hgz9ZhKqaRmMNQMCexdAE/GNnHhEMc1BLwA7MNvdFzWVM?=
 =?us-ascii?Q?uealzznh0xnOkrMNaWtnn+wpNi2H0i3xfS5oR7Er7DpfKImVUTH9cRyRn7UU?=
 =?us-ascii?Q?vr/5DKmHDDcOIT0EI6XvQQOuY6hiC1Ay2VPEjZyhwekk6I7NNlg6ATdi/hOZ?=
 =?us-ascii?Q?1DHItQeip3JoRe1h3fVO+HycqQcWfzLePrEwp2M9Wbncnc5CrCN6EBGKu+7e?=
 =?us-ascii?Q?iJ2DzIQ0goZ8pV/24WYlECDCyrkesl+eQaJVnrDmuX/oJpe4mnG8yiTBHn7Y?=
 =?us-ascii?Q?TMThqVjCoXiIeuXrnPG7BnAhQ7bW22A30BGD68HdUj9VXbgasjrmAXc+SCEu?=
 =?us-ascii?Q?8FK22W4Lg1vJMbKrtW1C641mZmYg2Lb2bca/GBSnWVZIINFidMTB8y4AzGVU?=
 =?us-ascii?Q?vI9iCkPr5E7eXaywk8sQD+jJMjnCv6dt4WQijDuuF/wiEs1OkN/2B6WFNX67?=
 =?us-ascii?Q?zBwfrC+Y6fIn1PJVKnuockeQyp5V8yUtHsFfbiSAZ5KxJZTkimiFdhM/it5F?=
 =?us-ascii?Q?SD3eRtGZnPXNy82YUUNMTEWjNIkvmxbS31tYr8GxNJAQ3KeboeJ48b3zBocC?=
 =?us-ascii?Q?v+dQZl8DB0Vx9refKZQgcyDi4CFOGjybai7TVDxUEKAxAei5d3UA90sDP3tr?=
 =?us-ascii?Q?yQMqssGRp5/0jroewnyj6t97Jwl3RRqx1APcIXEBMgtc/Ezv+xQUU3/ans4h?=
 =?us-ascii?Q?d31dQXfkNq/jgVVFeRj0rFBnI0q6baLmg4OlEpC7+lSJ5pKYWGgeyQ2dtGur?=
 =?us-ascii?Q?5vkqqz/OaT30jQuegklBMXq6euyFOuobwVELUOlWuZwrAaAqlwLGwaVtOnKc?=
 =?us-ascii?Q?py70TVQ5YUbTunfnnRkg/yUoSk/kg4e3e4WoE0AkCmJAgSeY6QzccBl+iB8A?=
 =?us-ascii?Q?bcHlqt5hMhcgJauguYIxVc5nRomJtqVX/JTX3RODwmidwU9tm0bVT5NSqMEe?=
 =?us-ascii?Q?RV8H+yEq0mMkk1YrV7gQjcJiLjERC8Ut2LOGyq42D1Zk/xSntAdj2udbbvoJ?=
 =?us-ascii?Q?CvfGs+w52hcPKftG2hNu0AC3lZRIPDpZfAlDDtO2mt9dTQcp4WvliM9DHbtw?=
 =?us-ascii?Q?cSwlE/gZfD3t89tqgnsAEa+/wog2MWkuKl8gGvSvjVW74D9+BshbNzARd/F/?=
 =?us-ascii?Q?XwFWpkYo1OkiASMM28Hv/U3hvL1y6f7QtqOIiOLrU7xUnoOhkbIUTdXBP9Fc?=
 =?us-ascii?Q?jq8WX9cqWC3yp1siU/uvNy+uqmSVOgrLmBHbKgEfOdO5llUEwIcbtHAoAHbE?=
 =?us-ascii?Q?+xN8I1d5+day12AWnw8AMhcTpZZN7N18MBaQQzKV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2536ad06-9984-48a7-4bb7-08dc21ae9958
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:14:56.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD1J+G4uzg921fW9R7bvLFDGQySN2uhSwvx01xK2ENvW+VqxsG/t9WxAIjSnuDkt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9287

Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
could have been left as NULL. The NULL domain is specially recognized by
host1x_client_iommu_attach() as meaning it is not the DMA domain and
should be replaced with the special shared domain.

This happened prior to the below commit because tegra-smmu was using the
NULL domain to mean IDENTITY.

Now that the domain is properly labled the test in DRM doesn't see NULL.
Check for IDENTITY as well to enable the special domains.

Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
Reported-by: diogo.ivo@tecnico.ulisboa.pt
Closes: https://lore.kernel.org/all/bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh/
Tested-by: diogo.ivo@tecnico.ulisboa.pt
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ff36171c8fb700..a73cff7a307082 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -960,7 +960,8 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 	 * not the shared IOMMU domain, don't try to attach it to a different
 	 * domain. This allows using the IOMMU-backed DMA API.
 	 */
-	if (domain && domain != tegra->domain)
+	if (domain && domain->type != IOMMU_DOMAIN_IDENTITY &&
+	    domain != tegra->domain)
 		return 0;
 
 	if (tegra->domain) {

base-commit: 755bd21c4a64124e9c85a77e742df3073eac9a41
-- 
2.43.0


