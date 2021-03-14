Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12C233A539
	for <lists+linux-tegra@lfdr.de>; Sun, 14 Mar 2021 15:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCNOtc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 14 Mar 2021 10:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhCNOtW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 10:49:22 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B52C061574;
        Sun, 14 Mar 2021 07:49:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id f16so13183353ljm.1;
        Sun, 14 Mar 2021 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tWgDrwjuSGHNr/Jwi4GNVEPVMpjAbqpRkbs/GJ+MEPw=;
        b=s3+h8c0kkDIz8lWxVLVL/gCuzG0UgVW75WfNZGRKWgGfRHtDKM25SEziXtgiCYtulD
         0ZqwZjvV03mx1ind0ki5nvjnpbSBToInPtRzJtbZhCZguznTGxVmuw0LvtRKtXIyNmjv
         oqku7lIHvgQXOh2GhbcqEhlr3Sr8/sqeY6dGX9bDWM4TfjU2+AgH/5dmBTjictVQlM+s
         6dLSZyqdCpAkf/6YYM6YDEK5bnrTc/jiDFcntk+lfUafdQwBHYE4CU2dfZTK7vAgrhbt
         vqhr6bSlBhlWfgz11RbheNjY2caAQ+CFLiQLoGdh/NUHfEcVa//vTpZMO5EqDwTo8lDp
         k+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tWgDrwjuSGHNr/Jwi4GNVEPVMpjAbqpRkbs/GJ+MEPw=;
        b=pZyDMpQlM9ct+J57uCJG7dIagS+T3TEFyFiTZREOsGb7GcRnncqDb+8/Cjv/LMBuYE
         lsxY1X3JEp4J2kwpXAeG4Ohow5pUzoeby577SEjjzHJUFellvk0FRiadPYIhdMVZCgY/
         EWPjX4icu1ElRZYzpV84uAFI+SLBy7Kj/JyEJPX0JSV+Da8B8Q7k8nTcPOF3/34m/yoh
         t4qCmEcCEBPphJvleRooOTDMxk9FJd2FEsFmr3yq6exB2Ev+2WclK39OgWoF79Ra9qNx
         GKwfoQG6qC61rsWMHtQCY5RF3/EZywxIDcMKgoae1mDyrAVLzcw/7aTzst11cD7B1Z3w
         zsZQ==
X-Gm-Message-State: AOAM530JkMAoe6WI3LKHJos1xmJqmnQDX5ARc/0bvGlvQ70A+6tPSOS4
        4PqmPF9dfh5xseTzqMq7E1ff7WEPmYE=
X-Google-Smtp-Source: ABdhPJxRv3E0IJazNsp4AGTTrrYy9SXTRGCiTHMhtI8ONJu3xtHaxWulEkofg7WGfhR+lu7J0+brOw==
X-Received: by 2002:a2e:9a4e:: with SMTP id k14mr8142435ljj.116.1615733359705;
        Sun, 14 Mar 2021 07:49:19 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id z14sm2643171ljk.33.2021.03.14.07.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 07:49:19 -0700 (PDT)
Subject: Re: [PATCH v3] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210314080653.29374-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3392a4a9-b3f1-9c90-3de2-008241a98270@gmail.com>
Date:   Sun, 14 Mar 2021 17:49:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210314080653.29374-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.03.2021 11:06, Nicolin Chen пишет:
> This patch dumps all active mapping entries from pagetable
> to a debugfs directory named "mappings".
> 
> Ataching an example:
> 
> SWGROUP: hc
> ASID: 0
> reg: 0x250
> PTB_ASID: 0xe0080004
> as->pd_dma: 0x80004000
> {
>         [1023] 0xf008000b (1)
>         {
>                 PTE RANGE      | ATTR | PHYS               | IOVA               | SIZE
>                 [#1023, #1023] | 0x5  | 0x0000000111a8d000 | 0x00000000fffff000 | 0x1000
>         }
> }
> Total PDE count: 1
> Total PTE count: 1
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v3:
>  * Fixed PHYS and IOVA print formats
>  * Changed variables to unsigned int type
>  * Changed the table outputs to be compact
> v2: https://lkml.org/lkml/2021/3/9/1382
>  * Expanded mutex range to the entire function
>  * Added as->lock to protect pagetable walkthrough
>  * Replaced devm_kzalloc with devm_kcalloc for group_debug
>  * Added "PTE RANGE" and "SIZE" columns to group contiguous mappings
>  * Dropped as->count check; added WARN_ON when as->count mismatches pd[pd_index]
> v1: https://lkml.org/lkml/2020/9/26/70
> 
>  drivers/iommu/tegra-smmu.c | 175 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 170 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 97eb62f667d2..269737d51ad4 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -19,6 +19,11 @@
>  #include <soc/tegra/ahb.h>
>  #include <soc/tegra/mc.h>
>  
> +struct tegra_smmu_group_debug {
> +	const struct tegra_smmu_swgroup *group;
> +	void *priv;
> +};
> +
>  struct tegra_smmu_group {
>  	struct list_head list;
>  	struct tegra_smmu *smmu;
> @@ -47,6 +52,8 @@ struct tegra_smmu {
>  	struct dentry *debugfs;
>  
>  	struct iommu_device iommu;	/* IOMMU Core code handle */
> +
> +	struct tegra_smmu_group_debug *group_debug;
>  };
>  
>  struct tegra_smmu_as {
> @@ -152,6 +159,9 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
>  
>  #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
>  				 SMMU_PDE_NONSECURE)
> +#define SMMU_PTE_ATTR		(SMMU_PTE_READABLE | SMMU_PTE_WRITABLE | \
> +				 SMMU_PTE_NONSECURE)
> +#define SMMU_PTE_ATTR_SHIFT	(29)
>  
>  static unsigned int iova_pd_index(unsigned long iova)
>  {
> @@ -163,6 +173,12 @@ static unsigned int iova_pt_index(unsigned long iova)
>  	return (iova >> SMMU_PTE_SHIFT) & (SMMU_NUM_PTE - 1);
>  }
>  
> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
> +{
> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> +}
> +
>  static bool smmu_dma_addr_valid(struct tegra_smmu *smmu, dma_addr_t addr)
>  {
>  	addr >>= 12;
> @@ -334,7 +350,7 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
>  }
>  
>  static const struct tegra_smmu_swgroup *
> -tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
> +tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup, int *index)
>  {
>  	const struct tegra_smmu_swgroup *group = NULL;
>  	unsigned int i;
> @@ -342,6 +358,8 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
>  	for (i = 0; i < smmu->soc->num_swgroups; i++) {
>  		if (smmu->soc->swgroups[i].swgroup == swgroup) {
>  			group = &smmu->soc->swgroups[i];
> +			if (index)
> +				*index = i;
>  			break;
>  		}
>  	}
> @@ -350,19 +368,22 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
>  }
>  
>  static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
> -			      unsigned int asid)
> +			      struct tegra_smmu_as *as)
>  {
>  	const struct tegra_smmu_swgroup *group;
> +	unsigned int asid = as->id;
>  	unsigned int i;
>  	u32 value;
>  
> -	group = tegra_smmu_find_swgroup(smmu, swgroup);
> +	group = tegra_smmu_find_swgroup(smmu, swgroup, &i);
>  	if (group) {
>  		value = smmu_readl(smmu, group->reg);
>  		value &= ~SMMU_ASID_MASK;
>  		value |= SMMU_ASID_VALUE(asid);
>  		value |= SMMU_ASID_ENABLE;
>  		smmu_writel(smmu, value, group->reg);
> +		if (smmu->group_debug)
> +			smmu->group_debug[i].priv = as;
>  	} else {
>  		pr_warn("%s group from swgroup %u not found\n", __func__,
>  				swgroup);
> @@ -389,13 +410,15 @@ static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
>  	unsigned int i;
>  	u32 value;
>  
> -	group = tegra_smmu_find_swgroup(smmu, swgroup);
> +	group = tegra_smmu_find_swgroup(smmu, swgroup, &i);
>  	if (group) {
>  		value = smmu_readl(smmu, group->reg);
>  		value &= ~SMMU_ASID_MASK;
>  		value |= SMMU_ASID_VALUE(asid);
>  		value &= ~SMMU_ASID_ENABLE;
>  		smmu_writel(smmu, value, group->reg);
> +		if (smmu->group_debug)
> +			smmu->group_debug[i].priv = NULL;
>  	}
>  
>  	for (i = 0; i < smmu->soc->num_clients; i++) {
> @@ -499,7 +522,7 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>  		if (err)
>  			goto disable;
>  
> -		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
> +		tegra_smmu_enable(smmu, fwspec->ids[index], as);
>  	}
>  
>  	if (index == 0)
> @@ -1058,8 +1081,135 @@ static int tegra_smmu_clients_show(struct seq_file *s, void *data)
>  
>  DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
>  
> +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> +{
> +	struct tegra_smmu_group_debug *group_debug = s->private;
> +	const struct tegra_smmu_swgroup *group;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
> +	unsigned int pd_index;
> +	unsigned int pt_index;
> +	unsigned long flags;
> +	u64 pte_count = 0;
> +	u32 pde_count = 0;
> +	u32 val, ptb_reg;
> +	u32 *pd;
> +
> +	if (!group_debug || !group_debug->priv || !group_debug->group)
> +		return 0;
> +
> +	group = group_debug->group;
> +	as = group_debug->priv;
> +	smmu = as->smmu;
> +
> +	mutex_lock(&smmu->lock);
> +
> +	val = smmu_readl(smmu, group->reg) & SMMU_ASID_ENABLE;
> +	if (!val)
> +		goto unlock;
> +
> +	pd = page_address(as->pd);
> +	if (!pd)
> +		goto unlock;
> +
> +	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n", group->name, as->id, group->reg);
> +
> +	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
> +	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);
> +
> +	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: 0x%llx\n", ptb_reg, as->pd_dma);
> +	seq_puts(s, "{\n");
> +
> +	spin_lock_irqsave(&as->lock, flags);
> +
> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> +		struct page *pt_page;
> +		u32 *addr;
> +		int i;
> +
> +		/* An empty PDE should not have a pte use count */
> +		WARN_ON_ONCE(!pd[pd_index] ^ !as->count[pd_index]);
> +
> +		/* Skip this empty PDE */
> +		if (!pd[pd_index])
> +			continue;
> +
> +		pde_count++;
> +		pte_count += as->count[pd_index];
> +		seq_printf(s, "\t[%d] 0x%x (%d)\n", pd_index, pd[pd_index], as->count[pd_index]);
> +		pt_page = as->pts[pd_index];
> +		addr = page_address(pt_page);
> +
> +		seq_puts(s, "\t{\n");
> +		seq_printf(s, "\t\t%-14s | %-4s | %-10s%8s | %-10s%8s | %-11s\n",
> +			   "PTE RANGE", "ATTR", "PHYS", sizeof(phys_addr_t) > 4 ? " " : "",
> +			   "IOVA", sizeof(unsigned long) > 4 ? " " : "", "SIZE");
> +		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index += i) {
> +			size_t size = SMMU_SIZE_PT;
> +			unsigned long iova;
> +			phys_addr_t pa;
> +
> +			i = 1;
> +
> +			if (!addr[pt_index])
> +				continue;
> +
> +			iova = pd_pt_index_iova(pd_index, pt_index);
> +			pa = SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR);
> +
> +			/* Check contiguous mappings and increase size */
> +			while (pt_index + i < SMMU_NUM_PTE) {
> +				phys_addr_t next_pa;
> +				u64 next_iova;
> +
> +				if (!addr[pt_index + i])
> +					break;
> +
> +				next_iova = pd_pt_index_iova(pd_index, pt_index + i);
> +				next_pa = SMMU_PFN_PHYS(addr[pt_index + i] & ~SMMU_PTE_ATTR);
> +
> +				/* Break at the end of a linear mapping */
> +				if ((next_iova - iova != SMMU_SIZE_PT * i) ||
> +				    (next_pa - pa != SMMU_SIZE_PT * i))
> +					break;
> +
> +				i++;
> +			}
> +
> +			seq_printf(s, "\t\t[#%-4d, #%-4d] | 0x%-2x | %pa | %pad | 0x%-9lx\n",
> +				   pt_index, pt_index + i - 1,
> +				   addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
> +				   &pa, &iova, size * i);

The formatting is still incorrect:

drivers/iommu/tegra-smmu.c: In function ‘tegra_smmu_mappings_show’:
drivers/iommu/tegra-smmu.c:1119:50: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘dma_addr_t’ {aka ‘unsigned int’} [-Wformat=]
 1119 |  seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: 0x%llx\n", ptb_reg, as->pd_dma);
      |                                               ~~~^              ~~~~~~~~~~
      |                                                  |                |
      |                                                  |                dma_addr_t {aka unsigned int}
      |                                                  long long unsigned int
      |                                               %x
drivers/iommu/tegra-smmu.c:1178:68: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 8 has type ‘size_t’ {aka ‘unsigned int’} [-Wformat=]
 1178 |    seq_printf(s, "\t\t[#%-4d, #%-4d] | 0x%-2x | %pa | %pad | 0x%-9lx\n",
      |                                                                ~~~~^
      |                                                                    |
      |                                                                    long unsigned int
      |                                                                %-9x
......
 1181 |        &pa, &iova, size * i);
      |                    ~~~~~~~~                                         
      |                         |
      |                         size_t {aka unsigned int}



I fixed it up like this:

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index daf74e26f14e..dbf2d4003132 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1111,12 +1111,14 @@ static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
 	if (!pd)
 		goto unlock;
 
-	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n", group->name, as->id, group->reg);
+	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n",
+		   group->name, as->id, group->reg);
 
 	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
 	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);
 
-	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: 0x%llx\n", ptb_reg, as->pd_dma);
+	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: %pad\n",
+		   ptb_reg, &as->pd_dma);
 	seq_puts(s, "{\n");
 
 	spin_lock_irqsave(&as->lock, flags);
@@ -1135,17 +1137,20 @@ static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
 
 		pde_count++;
 		pte_count += as->count[pd_index];
-		seq_printf(s, "\t[%d] 0x%x (%d)\n", pd_index, pd[pd_index], as->count[pd_index]);
+		seq_printf(s, "\t[%d] 0x%x (%d)\n",
+			   pd_index, pd[pd_index], as->count[pd_index]);
 		pt_page = as->pts[pd_index];
 		addr = page_address(pt_page);
 
 		seq_puts(s, "\t{\n");
-		seq_printf(s, "\t\t%-14s | %-4s | %-10s%8s | %-10s%8s | %-11s\n",
-			   "PTE RANGE", "ATTR", "PHYS", sizeof(phys_addr_t) > 4 ? " " : "",
-			   "IOVA", sizeof(unsigned long) > 4 ? " " : "", "SIZE");
+		seq_printf(s, "\t\t%-14s | %-4s | %-10s%s | %-10s%s | %-11s\n",
+			   "PTE RANGE", "ATTR",
+			   "PHYS", sizeof(phys_addr_t) > 4 ? "        " : "",
+			   "IOVA", sizeof(dma_addr_t)  > 4 ? "        " : "",
+			   "SIZE");
 		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index += i) {
 			size_t size = SMMU_SIZE_PT;
-			unsigned long iova;
+			dma_addr_t iova;
 			phys_addr_t pa;
 
 			i = 1;
@@ -1158,8 +1163,8 @@ static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
 
 			/* Check contiguous mappings and increase size */
 			while (pt_index + i < SMMU_NUM_PTE) {
+				dma_addr_t next_iova;
 				phys_addr_t next_pa;
-				u64 next_iova;
 
 				if (!addr[pt_index + i])
 					break;
@@ -1175,7 +1180,7 @@ static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
 				i++;
 			}
 
-			seq_printf(s, "\t\t[#%-4d, #%-4d] | 0x%-2x | %pa | %pad | 0x%-9lx\n",
+			seq_printf(s, "\t\t[#%-4d, #%-4d] | 0x%-2x | %pa | %pad | 0x%-9zx\n",
 				   pt_index, pt_index + i - 1,
 				   addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
 				   &pa, &iova, size * i);

